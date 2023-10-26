import 'package:flutter/material.dart';
import 'package:meal_app/screens/faq_screen.dart';
import 'package:meal_app/screens/settings_screen.dart';
import 'package:meal_app/screens/about_screen.dart';


class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.blueGrey,
            child: const Text(
              "The OMAR",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Color.fromARGB(255, 255, 255, 255)
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            'Home',
            Icons.home_filled,
            () {
              Navigator.of(context).pushReplacementNamed('/Home');
            },
          ),
          buildListTile(
            'About Us',
            Icons.info,
            () {
              Navigator.of(context).pushReplacementNamed(AboutScreen.routName);
            },
          ),
          buildListTile(
            'FAQ', 
            Icons.question_mark_rounded,
            () {
              Navigator.of(context).pushReplacementNamed(FaqScreen.routName);
           },
          ),
          const SizedBox.square(
            dimension: 415,
          ),
          buildListTile(
            'Settings',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(SettingsScreen.routName);
            },
          ),
        ],
      ),
    );
  }
}
