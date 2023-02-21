import 'package:demo_domesco/views/multiple_report.dart';
import 'package:demo_domesco/views/single_report.dart';
import 'package:demo_domesco/views/trending_report.dart';
import 'package:flutter/material.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _buildScreens() =>
      [SingleReport(), MultipleReport(), TrendingReport()];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.looks_one_rounded),
            title: "Báo cáo đơn",
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.multitrack_audio),
          title: "Báo cáo kết hợp",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.trending_up_sharp),
          title: "Trend",
          activeColorPrimary: Colors.blueAccent,
          inactiveColorPrimary: Colors.grey,
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Domesco"),
      ),
      body: PersistentTabView(
        context,
        screens: _buildScreens(),
        items: _navBarsItems(),
        resizeToAvoidBottomInset: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        bottomScreenMargin: 0,
        backgroundColor: Colors.black,
        decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property
      ),
    );
  }
}
