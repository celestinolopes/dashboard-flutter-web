import 'package:flutter/material.dart';
import 'package:flutter_2/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double currentSize = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[800], //Color(0xFF3c8dbc),
          elevation: 0,
          title: Text(
            'Perdidos & Achados',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          actions: [
            IconButton(icon: Icon(Icons.mail_outline), onPressed: () {})
          ],
        ),
        drawer: Drawer(),
        drawerEdgeDragWidth: 200,
        body: Home(),
      ),
    );
  }
}
