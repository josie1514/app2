import 'package:flutter/material.dart';
import 'package:meal_app/widgets/side_drawer.dart';
import 'package:meal_app/screens/connect_omar.dart';
import 'package:provider/provider.dart';
import 'package:meal_app/models/user_data.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
    TextEditingController _nameController = TextEditingController();
    DateTime dateOfBirth = DateTime.now();
    double feet = 5.0; // Store the selected feet
    double inches = 0.0; // Store the selected inches

  @override
    void initState() {
      super.initState();
      final UserSettings = Provider.of<UserSettings>(context, listen: true);
      _nameController.text = UserSettings.name;
      feet = UserSettings.feet;
      inches = UserSettings.inches;
    }

    @override
    Widget build(BuildContext context) {
      final userSettings = Provider.of<UserSettings>(context, listen: false);

      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Settings'),
          actions: [
            IconButton(
              onPressed: () {
                saveSettings(userSettings, _nameController, dateOfBirth, feet, inches);
              },
              icon: const Icon(Icons.save_rounded),
              tooltip: "Save",
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                readOnly: false,
                decoration: InputDecoration(labelText: 'Date of Birth'),
                onTap: () {
                  _selectDate(context);
                },
                controller: TextEditingController(
                  text: _formatDate(dateOfBirth),
                ),
              ),
              // Use a Slider for feet input
              Slider(
                value: feet,
                onChanged: (newFeet) {
                  setState(() {
                    feet = newFeet;
                  });
                },
                min: 0.0, // Set your minimum height in feet
                max: 8.0, // Set your maximum height in feet
                divisions: 8, // Number of divisions for feet
                label: feet.toStringAsFixed(1),
              ),
              // Use a Slider for inches input
              Slider(
                value: inches,
                onChanged: (newInches) {
                  setState(() {
                    inches = newInches;
                  });
                },
                min: 0.0, // Set your minimum inches (0-11)
                max: 11.0, // Set your maximum inches (0-11)
                divisions: 11, // Number of divisions for inches
                label: inches.toStringAsFixed(1),
              ),
              ElevatedButton(
                onPressed: () {
                  saveSettings(userSettings, _nameController, dateOfBirth, feet, inches);
                },
                child: Text('Save Settings'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ConnectOmar.routName);
                },
                child: Text('Connect to OMAR'),
              ),
              Text('Name: ${userSettings.name}'),
              Text('Date of Birth: ${userSettings.toString().split(' ')[0]}'),
              Text('Height: ${feet.toStringAsFixed(1)} feet ${inches.toStringAsFixed(1)} inches'),
            ],
          ),
        ),
      );
    }

    String _formatDate(DateTime date) {
      return date.toString().split(' ')[0];
    }

    void saveSettings(UserSettings userSettings, TextEditingController nameController, DateTime dateOfBirth, double feet, double inches) {
      userSettings.updateSettings(_nameController.text, dateOfBirth, feet, inches);
    }

    Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: dateOfBirth, 
      firstDate: DateTime(1900), 
      lastDate: DateTime.now(),
      );

    if (picked != null) {
      setState(() {
        dateOfBirth = picked;
      });
    }
  }
}