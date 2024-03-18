import 'package:book_review_app/domein/theme_mode_provider.dart';
import 'package:book_review_app/presentation/pages/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('テーマ'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                title: const Text('テーマ'),
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
            title: const Text('アカウント関連'),
            tiles: [
              SettingsTile(
                title: const Text('ログアウトする'),
                leading: const Icon(Icons.exit_to_app),
                onPressed: (BuildContext context) async {
                  await FirebaseAuth.instance.signOut();
                  await Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute<void>(
                      builder: (context) => const SignInPage(),
                    ),
                    (_) => false,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
