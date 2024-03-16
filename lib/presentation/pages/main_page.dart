import 'package:book_review_app/presentation/pages/book_library.dart';
import 'package:book_review_app/presentation/pages/home_page.dart';
import 'package:book_review_app/presentation/pages/my_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseTabViewProvider = StateProvider<ViewType>((ref) => ViewType.home);

class MainPage extends ConsumerWidget {
  final widgets = [
    const HomePage(),
    const BookLibrary(),
    const MyPage(),
  ];
  MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(baseTabViewProvider);
    return Scaffold(
      body: Center(
        child: widgets[viewState.index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewState.index,
        onTap: (int index) {
          ref.read(baseTabViewProvider.notifier).state = ViewType.values[index];
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '本棚',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'マイページ',
          ),
        ],
      ),
    );
  }
}

enum ViewType { home, books, myPage }
