import 'package:book_review_app/presentation/pages/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('セクション1'),
            tiles: [
              SettingsTile(
                title: const Text('テーマ'),
                leading: const Icon(Icons.color_lens),
                onPressed: (BuildContext context) {},
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
