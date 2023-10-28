import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserSettings extends ChangeNotifier {
  String name = '';
  DateTime dateOfBirth = DateTime.now();
  double feet = 0.0;
  double inches = 0.0;

  void updateSettings(String name, DateTime dateOfBirth, double feet, double inches) {
    this.name = name;
    this.dateOfBirth = dateOfBirth;
    this.feet = feet;
    this.inches = inches;
    notifyListeners();
  }
}

