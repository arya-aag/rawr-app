import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  final int _currentIndex;

  BottomNavbar(this._currentIndex);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavbarState();
  }
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List<String> _routes = ['/', '/create-post', '/profile'];

  void _onTabTapped(int index) {
    String routeTapped = _routes[index];
    if (index == 0) {
      Navigator.pushNamedAndRemoveUntil(
          context, routeTapped, (Route<dynamic> route) => false);
    } else {
      Navigator.pushNamed(context, routeTapped);
    }
  }

  List<BottomNavigationBarItem> _buildNavbarItems(
      List<Map<String, IconData>> items) {
    var list = items.map<BottomNavigationBarItem>((item) {
      return BottomNavigationBarItem(
        title: Text(
          item.keys.first,
          style: TextStyle(fontSize: 11.0),
        ),
        icon: Icon(item.values.first),
      );
    }).toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onTabTapped,
      currentIndex: widget._currentIndex,
      items: _buildNavbarItems([
        {'Home': Icons.home},
        {'Create': Icons.add_circle_outline},
        {'Profile': Icons.person_outline}
      ]),
    );
  }
}
