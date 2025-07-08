import 'package:flutter/material.dart';
import 'includes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: dataBaseUrl,
    anonKey: dataBaseKey,
  );
  runApp(const NutriTracker());
}

class _NutriTrackerState extends State<NutriTracker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: "Avenir",
        primaryColor: Color(primaryColor),
        scaffoldBackgroundColor: CupertinoColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: CupertinoColors.white,
          elevation: 0,
          toolbarHeight: 80,
        ),
        navigationBarTheme: const NavigationBarThemeData(
            elevation: 0,
            indicatorColor: CupertinoColors.white,
            surfaceTintColor: CupertinoColors.transparent,
            backgroundColor: CupertinoColors.white),
        cupertinoOverrideTheme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(
              fontFamily: "Avenir",
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
      home: const UserInfo(),
    );
  }
}

class NutriTracker extends StatefulWidget {
  const NutriTracker({super.key});

  @override
  State<NutriTracker> createState() => _NutriTrackerState();
}
