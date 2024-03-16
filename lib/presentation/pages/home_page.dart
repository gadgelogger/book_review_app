import 'package:book_review_app/presentation/pages/setting_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const SettingPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('ホーム画面'),
      ),
    );
  }
}
