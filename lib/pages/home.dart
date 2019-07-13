import 'package:flutter/material.dart';

import './../widgets/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Icon(Icons.pets),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text(
          'You have landed on the home page!',
        ),
      ),
      bottomNavigationBar: BottomNavbar(0),
    );
  }
}
