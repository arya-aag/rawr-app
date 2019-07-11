import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './../states/tab_state.dart';

import './../widgets/bottom_navbar.dart';

class AccountDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccountDetailsPageState();
  }
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<TabState>(context).currentIndex = 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text(
          'You are seeing your account page!',
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
