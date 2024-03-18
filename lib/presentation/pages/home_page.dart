// home_page.dart
import 'package:book_review_app/domein/all_book_providers.dart';
import 'package:book_review_app/l10n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allBooks = ref.watch(allBooksProvider);
    final homePageLabel = t.homeScreen;
    return Scaffold(
      appBar: AppBar(title: Text(homePageLabel.title)),
      body: allBooks.when(
        data: (books) {
          if (books.isEmpty) {
            return Center(child: Text(homePageLabel.text));
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
                  trailing: book.bookImageUrl != null
                      ? Image.network(book.bookImageUrl!, fit: BoxFit.cover)
                      : const Icon(Icons.book),
                  title: Text(book.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(formattedDate),
                      Text(book.description),
                      Text('著者: ${book.userName}'),
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
