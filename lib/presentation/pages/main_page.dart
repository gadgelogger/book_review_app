import 'package:book_review_app/l10n/strings.g.dart';
import 'package:book_review_app/presentation/pages/book_library_page.dart';
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
  final mainPageLabel = t.bottomNavigation;
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
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: mainPageLabel.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: mainPageLabel.books,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people),
            label: mainPageLabel.myPage,
          ),
        ],
      ),
    );
  }
}

enum ViewType { home, books, myPage }
