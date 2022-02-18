import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/home_page.dart';
import 'package:my_tasks/search_page.dart';
import 'package:my_tasks/view/blog_api_page.dart';

void main() => runApp(FluidNavBarDemo());

class FluidNavBarDemo extends StatefulWidget {
  @override
  State createState() {
    return _FluidNavBarDemoState();
  }
}

class _FluidNavBarDemoState extends State {
  Widget? _child;

  @override
  void initState() {
    _child = Homepage();
    super.initState();
  }

  @override
  Widget build(context) {
    // Build a simple container that switches content based of off the selected navigation item
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF75B7E1),
        extendBody: true,
        body: _child,
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
                icon: Icons.home,
                backgroundColor: Color(0xFF4285F4),
                extras: {"label": "home"}),
            FluidNavBarIcon(
                icon: Icons.bookmark_border,
                backgroundColor: Color(0xFFEC4134),
                extras: {"label": "bookmark"}),
            FluidNavBarIcon(
                icon: Icons.apps,
                backgroundColor: Color(0xFFFCBA02),
                extras: {"label": "partner"}),
            FluidNavBarIcon(
                icon: Icons.comment,
                backgroundColor: Color(0xFF34A950),
                extras: {"label": "conference"}),
          ],
          onChange: _handleNavigationChange,
          style: FluidNavBarStyle(iconUnselectedForegroundColor: Colors.white),
          scaleFactor: 1.5,
          defaultIndex: 1,
          itemBuilder: (icon, item) => Semantics(
            label: icon.extras!["label"],
            child: item,
          ),
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          //  _child = Homepage();
          break;
        case 1:
          // _child = Search();
          break;
        case 2:
          // _child = BlogsPage();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 100),
        child: _child,
      );
    });
  }
}
