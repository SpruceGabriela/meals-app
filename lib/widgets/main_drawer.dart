import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget createListTile(IconData icon, BuildContext context, String text, Function onTap){
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor, size: 26,),
      title: Text(text, style: TextStyle(fontSize: 20),),
      onTap: onTap,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 150,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).accentColor,
          alignment:Alignment.centerLeft,
          child: Text(
            'Cooking Up!', style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: Theme.of(context).primaryColor,
          ),
          ),
        ),
        SizedBox(height: 20,),
        createListTile(Icons.restaurant, context, 'Meals!',
            (){
              Navigator.of(context).pushReplacementNamed('/');
            }
        ),
        createListTile(Icons.settings, context, 'Filter',
            (){
              Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
            }
        ),
      ],),
    );
  }
}
