import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class ConnectOmar extends StatefulWidget{

  static const routName = '/connect_omar';

    @override
    _ConnectOmarState createState() => _ConnectOmarState();
}

class _ConnectOmarState extends State<ConnectOmar> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Connect to OMAR'),
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                //Search function for find OMAR devices
              },
              child: Text("Search for your OMAR device"),
            ),
          ],
        ),
      ),
    );
  }
}