// home_page.dart
import 'package:book_review_app/domein/all_book_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allBooks = ref.watch(allBooksProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ホーム')),
      body: allBooks.when(
        data: (books) => ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return ListTile(
              leading:
                  book.imageUrl != null ? Image.network(book.imageUrl!) : null,
              title: Text(book.title),
              subtitle: Text(book.description),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('エラーが発生しました: $error')),
      ),
    );
  }
}
