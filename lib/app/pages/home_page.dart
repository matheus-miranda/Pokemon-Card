import 'package:flutter/material.dart';
import 'package:pokemon/app/pages/all_cards_page.dart';
import 'package:pokemon/app/pages/favorite_cards_page.dart';
import 'package:pokemon/app/pages/obtained_cards_page.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const AllCardsPage(),
    const FavoriteCardsPage(),
    const ObtainedCardsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => changePage(index),
          items: const [
        BottomNavigationBarItem(icon: Icon(Icons.all_inclusive), label: 'Cards'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Obtained'),
      ]),
    );
  }

  changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
