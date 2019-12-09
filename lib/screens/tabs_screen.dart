import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Favorites'},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
        ),),
      body: _pages[_selectedPageIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        currentIndex: _selectedPageIndex, 
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.brown,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.category,),
          title: Text('Categories',),
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.star,),
          title: Text('Favorites',),
          ),
        ],
      ),
    );
  }
}

//example of top TabBar

// DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(title: Text('Meals'),
//         bottom: TabBar(
//           tabs: <Widget>[
//           Tab(icon: Icon(Icons.category), text: 'Categories',),
//           Tab(icon: Icon(Icons.star), text: 'Favorites',),
//             ],
//           ),
//         ),
//         body: TabBarView(children: <Widget>[
//           CategoriesScreen(),
//           FavoritesScreen(),
//         ],),
//       ),
//     );