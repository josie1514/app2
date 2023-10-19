import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Map<String, bool> currenSetting;
  final Function(Map<String, bool>) saveSettings;
  const SettingsScreen(this.currenSetting, this.saveSettings, {super.key});
  static const routName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _name = false;
  bool _DateOfBirth = false;
  bool _sitHeight = false;
  bool _ConnectOmar = false;
  @override
  void initState() {
    _name = widget.currenSetting['name']!;
    _DateOfBirth = widget.currenSetting['Date of Birth']!;
    _sitHeight = widget.currenSetting['Sit Height']!;
    _ConnectOmar = widget.currenSetting['Connect OMAR']!;
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
            "Settings",
          ),
          actions: [
            IconButton(
              onPressed: (() {
                final selectedSettings = {
                  'Name': _name,
                  'Date of Birth': _DateOfBirth,
                  'Sit Height': _sitHeight,
                  'Connect OMAR': _ConnectOmar,
                };
                widget.saveSettings(selectedSettings);
              }),
              icon: const Icon(Icons.save_rounded),
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
                  _name,
                  ((newValue) {
                    setState(() {
                      _name = newValue;
                    });
                  }),
                ),
                _buildSwitchListTile(
                  'Date of Birth',
                  'User D.O.B used for user stat research',
                  _DateOfBirth,
                  ((newValue) {
                    setState(() {
                      _DateOfBirth = newValue;
                    });
                  }),
                ),
                _buildSwitchListTile(
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
                  _ConnectOmar,
                  ((newValue) {
                    setState(() {
                      _ConnectOmar = newValue;
                    });
                  }),
                ),
              ],
            ))
          ],
        ));
  }
}
