//設定画面
import 'package:book_review_app/domein/theme_mode_provider.dart';
import 'package:book_review_app/domein/user_providers.dart';
import 'package:book_review_app/l10n/strings.g.dart';
import 'package:book_review_app/presentation/pages/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

Future<void> _logout(BuildContext context, WidgetRef ref) async {
  await FirebaseAuth.instance.signOut();
  ref.invalidate(userStreamProvider);
  await Navigator.of(context).pushReplacement(
    MaterialPageRoute<void>(
      builder: (context) => const SignInPage(),
    ),
  );
}

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingPageLabel = t.settingScreen;

    return Scaffold(
      appBar: AppBar(
        title: Text(settingPageLabel.title),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(settingPageLabel.themeTitle),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                title: Text(settingPageLabel.theme),
                leading: const Icon(Icons.color_lens),
                trailing: Text(
                  ref.watch(themeModeProvider).toString(),
                ),
                onPressed: (_) async {
                  await ref.read(themeModeProvider.notifier).toggle();
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text(settingPageLabel.accountTitle),
            tiles: [
              SettingsTile(
                title: Text(settingPageLabel.logout),
                leading: const Icon(Icons.exit_to_app),
                onPressed: (BuildContext context) async {
                  await _logout(context, ref);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
