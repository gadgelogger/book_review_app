import 'package:book_review_app/domein/user_providers.dart';
import 'package:book_review_app/l10n/strings.g.dart';
import 'package:book_review_app/presentation/pages/my_page_edit.dart';
import 'package:book_review_app/presentation/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPageScreenLabel = t.myPageScreen;

    final userDataAsyncValue = ref.watch(userStreamProvider);
    return userDataAsyncValue.when(
      data: (userData) => Scaffold(
        appBar: AppBar(
          title: Text(myPageScreenLabel.title),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: userData.imageUrl != null
                    ? NetworkImage(userData.imageUrl!)
                    : null,
                child: userData.imageUrl == ''
                    ? const Icon(Icons.person, size: 100)
                    : null,
              ),
              const SizedBox(height: 20),
              Text(userData.name, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              Text(
                '${myPageScreenLabel.bookCount}: ${userData.bookCount}${myPageScreenLabel.count}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => MyPageEdit(),
                    ),
                  );
                },
                child: Text(
                  myPageScreenLabel.editBunnton,
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => Text('エラー: $error'),
    );
  }
}
