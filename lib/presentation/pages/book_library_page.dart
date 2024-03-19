import 'package:book_review_app/domein/book_providers.dart';
import 'package:book_review_app/infrastructure/book_repository.dart';
import 'package:book_review_app/l10n/strings.g.dart';
import 'package:book_review_app/presentation/widgets/post_book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BookLibrary extends ConsumerWidget {
  const BookLibrary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBooks = ref.watch(myBooksProvider);
    final bookLibraryLabel = t.booksScreen;
    return Scaffold(
      appBar: AppBar(title: Text(bookLibraryLabel.title)),
      body: asyncBooks.when(
        data: (books) {
          if (books.isEmpty) {
            return Center(child: Text(bookLibraryLabel.text));
          }
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              final formattedDate =
                  DateFormat('yyyy/MM/dd').format(book.createdAt);
              return Dismissible(
                key: ValueKey(book.bookId),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) async {
                  await ref
                      .read(bookRepositoryProvider)
                      .deleteBook(book.bookId);
                },
                child: Card(
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
                      ],
                    ),
                  ),
                ),
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
