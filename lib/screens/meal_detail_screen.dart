import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';

  Widget sectionTile(String text, BuildContext context){
    return Container(
      margin: EdgeInsets.all(5),
      child: Text(text, style: Theme.of(context).textTheme.title,),
    );
  }

  Widget builderContainer(Widget child){
    return Container(
          decoration: BoxDecoration(color: Colors.white,),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(2),
          height: 300,
          width: 380,
          child: child,
        );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}'),),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          height: 300,
          width: double.infinity,
          child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
        ),
        sectionTile('Ingredients', context),
        builderContainer(
          ListView.builder(
            itemCount: selectedMeal.ingredients.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(selectedMeal.ingredients[index]),
            ),
          ),
        ),
        sectionTile('Steps', context),
        builderContainer(
          ListView.builder(
            itemCount: selectedMeal.steps.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Text('${(index + 1)}', style: TextStyle(color: Theme.of(context).accentColor),),),
              title: Text(selectedMeal.steps[index]),
            ),
          ),
        ),
      ],),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete_outline),
        onPressed: (){
          Navigator.of(context).pop();
        }
      ),
    );
  }
}