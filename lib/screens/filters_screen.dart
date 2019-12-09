import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchList(String title, bool currentValue, String subtitle, Function updateValue){
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
              icon:Icon(Icons.save),
              onPressed: (){
                final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildSwitchList('Gluten-free', _glutenFree, 'Only include gluten-free meals.',
                (newValue){
                  setState(() {
                    _glutenFree = newValue;
                  });
                }
              ),
              _buildSwitchList('Vegetarian', _vegetarian, 'Only include vegetarian meals.',
                (newValue){
                  setState(() {
                    _vegetarian = newValue;
                  });
                }
              ),
              _buildSwitchList('Vegan', _vegan, 'Only include vegan meals.',
                (newValue){
                  setState(() {
                    _vegan = newValue;
                  });
                }
              ),
              _buildSwitchList('Lactose-free', _lactoseFree, 'Only include lactose-free meals.',
                (newValue){
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }
              )
            ],
          ),
        ),
      ],),
    );
  }
}
