import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.currenSetting, this.saveSettings, {super.key});
  final Map<String, Object> currenSetting;
  final Function(Map<String, Object>) saveSettings;
  
  static const routName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _name = '';
  int _dateOfBirth = 0;
  int _sitHeight = 0;
  bool _connectOmar = false;
  
  @override
  void initState() {
    _name = '';
    _dateOfBirth = 0;
    _sitHeight = 0;
    _connectOmar = false;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currenState,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currenState,
      onChanged: updateValue,
    );
  }

  Widget _buildListTile(
    String title,
    String description,
    String currentValue,
    Function(String) updateValue,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: Text(currentValue),
      onTap: () {},
    );
  }

  Widget _buildIntListTile(
    String title,
    String description,
    int currentValue,
    Function(int) updateValue,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: Text(currentValue.toString()),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
          ),
          actions: [
            IconButton(
              onPressed: (() {
                final selectedSettings = {
                  'Name': _name,
                  'Date of Birth': _dateOfBirth,
                  'Sit Height': _sitHeight,
                  'Connect OMAR': _connectOmar,
                };
                widget.saveSettings(selectedSettings);
              }),
              icon: const Icon(Icons.save_rounded),
              tooltip: "Save",
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(),
            Expanded(
                child: ListView(
              children: [
                _buildListTile(
                  'Name',
                  'Users prefered name or alias during app use',
                  _name,
                  ((newValue) {
                    setState(() {
                      _name = '';
                    });
                  }),
                ),
                _buildIntListTile(
                  'Date of Birth',
                  'User D.O.B used for user stat research',
                  _dateOfBirth,
                  ((newValue) {
                    setState(() {
                      _dateOfBirth = newValue;
                    });
                  }),
                ),
                _buildIntListTile(
                  'Sitting Height',
                  'User Height while sitting (in FT)',
                  _sitHeight,
                  ((newValue) {
                    setState(() {
                     _sitHeight = newValue;
                    });
                  }),
                ),
                _buildSwitchListTile(
                  'Connect to OMAR',
                  'Connect to your OMAR Device',
                  _connectOmar,
                  ((newValue) {
                    setState(() {
                      _connectOmar = newValue;
                    });
                  }),
                ),
              ],
            ))
          ],
        ));
  }
}
