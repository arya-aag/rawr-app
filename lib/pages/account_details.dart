import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text(
          'You are seeing your account page!',
        ),
      ),
      bottomNavigationBar: BottomNavbar(2),
    );
  }
}
