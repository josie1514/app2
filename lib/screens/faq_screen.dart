import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  static const routName = '/faq';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FAQ",
        ),
      ),
      drawer: const MainDrawer(),
      body: ListView(
        children:const [
          ExpansionTile(
            title: Text('What type of patients can benefit from The OMAR?'),
            children: [
              Text('Flutter is a mobile app SDK for building high-performance, high-fidelity, apps for iOS and Android, from a single codebase.'),
            ],
          ),
          ExpansionTile(
            title: Text('How do I turn OMAR on?'),
            children: [
              Text('Flutter uses Dart, a modern object-oriented programming language.'),
            ],
          ),
          ExpansionTile(
            title: Text('How do I turn OMAR off?'),
            children: [
              Text('StatelessWidget is immutable, meaning that it cannot change its state during the lifetime of the widget. StatefulWidget, on the other hand, is mutable and can change its state during the lifetime of the widget.'),
            ],
          ),
          ExpansionTile(
            title: Text('How do I contact the support team?'),
            children: [
              Text('In Flutter, everything is a widget. A widget is an immutable description of part of a user interface. Widgets can be combined to create complex user interfaces.'),
            ],
          ),
        ],
      ),
    );
  }
}
