import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserSettings extends ChangeNotifier {
  String _name = '';
  DateTime _dateOfBirth = DateTime.now();
  double _feet = 0.0;
  double _inches = 0.0;

  void updateSettings(String name, DateTime dateOfBirth, double feet, double inches) {
    this._name = name;
    this._dateOfBirth = dateOfBirth;
    this._feet = feet;
    this._inches = inches;
    notifyListeners();
  }
}

