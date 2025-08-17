import '../../Controller/dashboard/dashboard.dart';
import 'package:flutter/material.dart' as material;
import '../../includes.dart';
import 'dart:convert';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedNavigation = 0;
  bool _routed = false; // guard

  @override
  void initState() {
    super.initState();
    if (debug) return;
    if (session == null) {
      session = supabase.auth.currentSession;
      user = supabase.auth.currentUser;
      printDebugMsg("User =>\n");
      debugPrint(
        const JsonEncoder.withIndent('  ').convert(user),
        wrapWidth: 1024,
      );
    }
    printDebugMsg("$userInfo =>\n");
    debugPrint(
      const JsonEncoder.withIndent('  ').convert(userInfo),
      wrapWidth: 1024,
    );
    // Defer until after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeRoute());
  }

  Future<void> _maybeRoute() async {
    if (_routed) return;
    final needsSurvey = await checkUserInfo(); // <-- no context param
    if (!mounted) return;

    if (needsSurvey) {
      _routed = true;
      newStackScreen(context, const Survey1());
    }
  }

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(
        centerTitle: true,
        title: const Appbar(),
        actions: [
          ImageButton(
            onClick: () => navigateTo(context, const ProfileScreen()),
            urlImage: imageUrl == null ? false : true,
            imagePath: imageUrl ?? "Avatar_male.png",
          )
        ],
      ),
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
