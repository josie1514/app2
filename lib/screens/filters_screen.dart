import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Map<String, bool> currenFilters;
  final Function(Map<String, bool>) saveFilters;
  const FiltersScreen(this.currenFilters, this.saveFilters, {super.key});
  static const routName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currenFilters['gluten']!;
    _lactoseFree = widget.currenFilters['lactose']!;
    _vegan = widget.currenFilters['vegan']!;
    _vegetarian = widget.currenFilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Your Filters",
          ),
          actions: [
            IconButton(
              onPressed: (() {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              }),
              icon: const Icon(Icons.save),
              tooltip: "Save",
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  'Name',
                  'Users prefered name or alias during app use',
                  _glutenFree,
                  ((newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                ),
                _buildSwitchListTile(
                  'Date of Birth',
                  'User D.O.B used for user stat research',
                  _lactoseFree,
                  ((newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                ),
                _buildSwitchListTile(
                  'Sitting Height',
                  'User Height while sitting (in FT)',
                  _vegetarian,
                  ((newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                ),
                _buildSwitchListTile(
                  'Connect to OMAR',
                  'Connect to your OMAR Device',
                  _vegan,
                  ((newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                ),
              ],
            ))
          ],
        ));
  }
}
