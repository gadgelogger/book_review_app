import 'package:book_review_app/domein/book_providers.dart';
import 'package:book_review_app/presentation/widgets/post_book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookLibrary extends ConsumerWidget {
  const BookLibrary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBooks = ref.watch(myBooksProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('本棚')),
      body: asyncBooks.when(
        data: (books) {
          if (books.isEmpty) {
            return const Center(child: Text('本を追加しよう！'));
          }
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return ListTile(
                leading: book.imageUrl != null
                    ? Image.network(book.imageUrl!, fit: BoxFit.cover)
                    : const Icon(Icons.book),
                title: Text(book.title),
                subtitle: Text(book.description),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('エラー: $error')),
      ),
      floatingActionButton: const PostBook(),
    );
  }
}
