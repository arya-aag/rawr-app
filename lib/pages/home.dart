import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './../states/tab_state.dart';

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
    Provider.of<TabState>(context).currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Icon(Icons.pets),
      ),
      body: Center(
        child: Text(
          'You have landed on the home page!',
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.pushNamed(context, '/create-post'),
      //   tooltip: 'Create Post',
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
