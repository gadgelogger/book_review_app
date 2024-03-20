import 'package:book_review_app/controller/firebase_provider.dart';
import 'package:book_review_app/domein/share_preferences_instance.dart';
import 'package:book_review_app/domein/theme_mode_provider.dart';
import 'package:book_review_app/l10n/strings.g.dart';
import 'package:book_review_app/presentation/pages/main_page.dart';
import 'package:book_review_app/presentation/pages/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesInstance.initialize();
  LocaleSettings.useDeviceLocale();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
    final authState = ref.watch(authStateChangeProvider);

    return MaterialApp(
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: ref.watch(themeModeProvider),
      home: authState.when(
        data: (user) {
          if (user == null) {
            return const SignInPage();
          } else {
            return MainPage();
          }
        },
        loading: () => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        error: (error, stackTrace) => const Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        ),
      ),
    );
  }
}
