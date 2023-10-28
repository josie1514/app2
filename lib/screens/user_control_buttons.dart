import 'package:flutter/material.dart';
import 'package:meal_app/widgets/side_drawer.dart';

class UserButtons extends StatefulWidget {
  const UserButtons({Key? key}) : super(key: key);


  static const routName = '/user_buttons';

  @override
  _UserButtonsState createState() => _UserButtonsState();
}

class _UserButtonsState extends State<UserButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Control Buttons'),
        
      ),
      drawer: const MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
      child: Center(
        child: RemoteButtons(),
      ),
      ),
    );
  }
}

class RemoteButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        RemoteButton('Up', Icons.arrow_upward),
        RemoteButton('Left', Icons.arrow_back),
        RemoteButton('Right', Icons.arrow_forward),
        RemoteButton('Down', Icons.arrow_downward),
      ]
    );
  }
}

class RemoteButton extends StatelessWidget {
  final String label;
  final IconData icon;

  RemoteButton(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          //implement button functionality here
          print('Button pressed: $label');
        },
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}