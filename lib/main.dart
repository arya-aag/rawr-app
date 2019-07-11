import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './states/tab_state.dart';

import './pages/home.dart';
import './pages/create_post.dart';
import './pages/account_details.dart';

void main() => runApp(RawrApp());

class RawrApp extends StatelessWidget {
  final Map<String, Widget Function(BuildContext)> _routes = {
    '/': (context) => HomePage(title: 'Rawr'),
    '/create-post': (context) => CreatePostPage(),
    '/profile': (context) => AccountDetailsPage(),
  };

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TabState(),
      child: MaterialApp(
        title: 'Rawr',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        initialRoute: '/',
        routes: _routes,
      ),
    );
  }
}
