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
    body: ListView(
      children:const[
        ExpansionTile(
          title: Text('What is The Optimized Meal Assistance Robot (OMAR)?'),
          children: [
            Text('OMAR is a robot that can assist you...'),
          ],
        ),
        ExpansionTile(
          title: Text('Who is the Assistive Robotics Team?'),
          children: [
            Text('The Assistive Robotics Team...'),
          ],
        ),
        ExpansionTile(
          title: Text('Why is it called "OMAR"?'),
          children: [
            Text('OMAR is...'),
          ],
        ),
      ],
      ),
    );
  }
}