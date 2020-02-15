import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Market Requirements',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Market Requirements',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showBottomNavigation(context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            color: Colors.black26,
            child: Card(
              color: Colors.black12,
              elevation: 10,
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                        child: Image.asset(
                          'lib/assets/images/thunder_shower.png',
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          'Due to overwhelming influence of North-Westerly winds it is expected that there will be over 520 cm of rain in North-Eastern and Southern States.', style: TextStyle(fontFamily: 'Roboto', fontSize: 17),
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.timeline),
            title: Text('Long Life'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.timelapse),
            title: Text('Short Life'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomNavigation(context),
        child: Icon(
          Icons.cloud,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
