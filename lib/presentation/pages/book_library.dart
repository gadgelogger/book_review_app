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
        child: Text('本棚画面'),
      ),
    );
  }
}
