import 'package:flutter/material.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[850],
      selectedItemColor: Colors.tealAccent,
      unselectedItemColor: Colors.grey[400],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '검색',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_filter),
          label: '공개 예정',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_sharp),
          label: '마이 노트',
        ),
      ],
    );
  }
}
