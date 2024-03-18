import 'package:book_review_app/domein/share_preferences_instance.dart';
import 'package:book_review_app/domein/theme_mode_provider.dart';
import 'package:book_review_app/presentation/pages/main_page.dart';
import 'package:book_review_app/presentation/pages/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesInstance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MainApp()));
}

ThemeData _buildTheme(Brightness brightness) {
  return ThemeData(
    colorSchemeSeed: Colors.lightGreen,
    useMaterial3: true,
    brightness: brightness,
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: ref.watch(themeModeProvider),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasData) {
            return MainPage();
          }
          return const SignInPage();
        },
      ),
    );
  }
}
