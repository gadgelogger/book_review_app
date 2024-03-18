// home_page.dart
import 'package:book_review_app/domein/all_book_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allBooks = ref.watch(allBooksProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ホーム')),
      body: allBooks.when(
        data: (books) {
          if (books.isEmpty) {
            return const Center(child: Text('本を追加しよう！'));
          }
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              final formattedDate =
                  DateFormat('yyyy/MM/dd').format(book.createdAt);
              return Card(
                elevation: 5,
                child: ListTile(
                  trailing: book.imageUrl != null
                      ? Image.network(book.imageUrl!, fit: BoxFit.cover)
                      : const Icon(Icons.book),
                  title: Text(book.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(formattedDate),
                      Text(book.description),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('エラー: $error')),
      ),
    );
  }
}
