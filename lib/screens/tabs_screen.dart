import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites'},
    ];

    super.initState();
  }

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