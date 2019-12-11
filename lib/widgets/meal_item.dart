import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText{
    switch (complexity){
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id
      ).then((result){
        if(result != null){
//          removeItem(result);
        }
    });
  }

  Widget buildInfo(IconData icon, String info){
    return Expanded(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(icon),
          ),
          Text(info, style: TextStyle(color: Colors.black),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              Image.network(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  color: Colors.black54,
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                  buildInfo(Icons.schedule, '$duration min'),
                  buildInfo(Icons.work, complexityText),
                  buildInfo(Icons.attach_money, affordabilityText)
                ],),
          ),
        ],),
      ),
    );
  }
}

