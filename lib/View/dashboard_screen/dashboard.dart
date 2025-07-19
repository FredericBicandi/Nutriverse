import '../../Controller/dashboard/dashboard.dart';
import 'package:flutter/material.dart' as material;

import '../../includes.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedNavigation = 0;

  @override
  void initState() {
    super.initState();
    checkUserInfo(context);
  }




  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(title: const ExtendedAppBar()),
      bottomNavigationBar: material.NavigationBar(
        elevation: 0,
        height: 60,
        onDestinationSelected: (int value) {
          setState(() => selectedNavigation = value);
        },
        indicatorColor: CupertinoColors.transparent,
        selectedIndex: selectedNavigation,
        destinations: [
          const material.NavigationDestination(
            icon: Icon(CupertinoIcons.star),
            selectedIcon: Icon(
              CupertinoIcons.star_fill,
              color: CupertinoColors.systemYellow,
            ),
            label: 'Home',
          ),
          const material.NavigationDestination(
            icon: Icon(CupertinoIcons.chart_bar_square_fill),
            selectedIcon: Icon(
              CupertinoIcons.chart_bar_square_fill,
              color: CupertinoColors.activeBlue,
            ),
            label: 'progress',
          ),
          material.NavigationDestination(
            icon: SizedBox(
              width: 60,
              height: 60,
              child: material.Card(
                color: Color(primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  material.Icons.add,
                  color: CupertinoColors.white,
                ),
              ),
            ),
            label: "",
          ),
          const material.NavigationDestination(
            icon: Icon(material.Icons.emoji_food_beverage_outlined),
            selectedIcon: Icon(
              material.Icons.emoji_food_beverage_rounded,
              color: CupertinoColors.destructiveRed,
            ),
            label: "Programs",
          ),
          const material.NavigationDestination(
            icon: Icon(material.Icons.food_bank_outlined),
            selectedIcon: Icon(
              material.Icons.food_bank_rounded,
              color: CupertinoColors.systemOrange,
            ),
            label: "Recipes",
          )
        ],
      ),
      body: const Center(),
    );
  }
}
