import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';
// About screen: includes a project description, a list of the team members, and a logo.

class AboutScreen extends StatelessWidget{
  const AboutScreen({super.key});

  static const routName = '/about';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: const Text(
        "About Us",
      ),
    ),
    drawer: const MainDrawer(),
    );
  }
}