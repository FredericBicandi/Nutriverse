import 'package:flutter/material.dart';
import 'package:nutritracker/View/login_screen/login_sheet.dart';

import '../../includes.dart';
import 'background_video.dart';

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          kDebugMode
              ? Image.asset(
                  "assets/images/welcome.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                )
              : const BackgroundVideo(),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: sizeOf(context, 0.35)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Healthy",
                      style: TextStyle(
                        fontSize: sizeOf(context, 0.18),
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      "Eating",
                      style: TextStyle(
                        fontSize: sizeOf(context, 0.18),
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      color: Color(accentColor),
                      child: Text(
                        "Simplified",
                        style: TextStyle(
                          fontSize: sizeOf(context, 0.08),
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: DynamicButton(
                    onClick: () => navigateToActionSheet(
                      context,
                      () => const LoginSheet(),
                    ),
                    setText: "Getting Started",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}
