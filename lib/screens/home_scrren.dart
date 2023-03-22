import 'package:flutter/material.dart';
import 'package:movies/models/Results.dart';
import 'package:movies/models2/Results2.dart';

import 'package:movies/screens/home_tab.dart';
import 'package:movies/screens/search_tab.dart';
import 'package:movies/screens/watch_list_tab.dart';

class HomeScreen extends StatefulWidget {
 static const routeName='HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Color.fromRGBO(255, 187, 59, 1.0),
        unselectedItemColor:Color.fromRGBO(198, 198, 198, 1.0) ,
        iconSize: 26,
        selectedFontSize: 14,
        unselectedFontSize: 10,
        onTap: (newSelectedIndex){
          setState(() {
            selectedIndex=newSelectedIndex;
          });
        },

        backgroundColor: Color.fromRGBO(26, 26, 26, 1.0),
        currentIndex:   selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'HOME',backgroundColor: Color.fromRGBO(26, 26, 26, 1.0),),
          BottomNavigationBarItem(icon: Icon(Icons.search),
          label: 'SEARCH',backgroundColor: Color.fromRGBO(26, 26, 26, 1.0),),

          BottomNavigationBarItem(icon: Icon(Icons.favorite),
              label: 'WATCHLIST',backgroundColor: Color.fromRGBO(26, 26, 26, 1.0),),

        ],
      ),
      body: tabs[selectedIndex],
    );
  }
  List<Widget> tabs=[HomeTab(),SearchTab(),WatchListTab(Results(),Results2())];
}
