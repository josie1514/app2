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
            title: Text('What is Flutter?'),
            children: [
              Text('Flutter is a mobile app SDK for building high-performance, high-fidelity, apps for iOS and Android, from a single codebase.'),
            ],
          ),
          ExpansionTile(
            title: Text('What programming language does Flutter use?'),
            children: [
              Text('Flutter uses Dart, a modern object-oriented programming language.'),
            ],
          ),
          ExpansionTile(
            title: Text('What is the difference between StatelessWidget and StatefulWidget?'),
            children: [
              Text('StatelessWidget is immutable, meaning that it cannot change its state during the lifetime of the widget. StatefulWidget, on the other hand, is mutable and can change its state during the lifetime of the widget.'),
            ],
          ),
          ExpansionTile(
            title: Text('What is a widget in Flutter?'),
            children: [
              Text('In Flutter, everything is a widget. A widget is an immutable description of part of a user interface. Widgets can be combined to create complex user interfaces.'),
            ],
          ),
        ],
      ),
    );
  }
}
