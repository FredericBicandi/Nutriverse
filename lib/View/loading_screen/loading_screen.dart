import 'package:nutritracker/Controller/authentication/authentication.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    checkUserAuth(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: SvgPicture.asset(
                            "assets/images/NutriTracker.svg",
                            // ignore: deprecated_member_use
                            color: Color(primaryColor),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                          child: Text(
                            "nutriTracker",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(primaryColor),
                              letterSpacing: 4.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 35,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Color(primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              "Powered by the holy spirit.",
              style: TextStyle(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
