import 'package:danhnhan/color.dart';
import 'package:danhnhan/favorite.dart';
import 'package:danhnhan/home.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  // final List<Widget> screens = [HomeTab(), FavoriteTab()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget _currentTab = HomeTab();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return HomeTab();
  }
}
