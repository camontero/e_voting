import 'package:e_voting/components/navBar.dart';
import 'package:e_voting/components/signInHeader.dart';
import 'package:e_voting/pages/favorites.page.dart';
import 'package:e_voting/pages/settings.page.dart';
import 'package:e_voting/pages/statistics.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  PageController _pageController = PageController(initialPage: 1);
  List<Widget> _pages = [
    FavoritesPage(),
    StatisticsPage(),
    SettingsPage()
  ];
  void _onPageChanged(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }


  @override
  Widget build(BuildContext context) {



    final viewStructure = Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: _onPageChanged,
        scrollDirection: Axis.horizontal,
        // physics: ,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,

      )
    );

    return viewStructure;
  }
}
