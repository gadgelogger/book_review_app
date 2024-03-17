import 'package:book_review_app/presentation/widgets/post_book_widget.dart';
import 'package:flutter/material.dart';

class BookLibrary extends StatelessWidget {
  const BookLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('本棚'),
      ),
      body: const Center(
        child: Text('本を追加しよう！'),
      ),
      floatingActionButton: const PostBook(),
    );
  }
}
