import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const routName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: const [
                ExpansionTile(
                  title: Text('What is The Optimized Meal Assistance Robot (OMAR)?'),
                  children: [
                    Text('The Optimized Meal Assistance Robot (OMAR) is an assistive robotic arm that empowers physically impaired individuals to independently feed themselves, reducing the workload on caregivers. This innovative technology incorporates facial tracking software, customized utensils, and a mobile application for enhanced functionality.'),
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
          ),
          Image.asset(
            'assets/images/group_photo.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
