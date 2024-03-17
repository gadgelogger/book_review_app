import 'package:book_review_app/domein/user_providers.dart';
import 'package:book_review_app/presentation/pages/my_page_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataAsyncValue = ref.watch(userProvider);
    return userDataAsyncValue.when(
      data: (userData) => Scaffold(
        appBar: AppBar(
          title: const Text('マイページ'),
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
                '本の数: ${userData.bookCount}冊',
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
                child: const Text(
                  '編集',
                  style: TextStyle(fontSize: 20, color: Colors.green),
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
