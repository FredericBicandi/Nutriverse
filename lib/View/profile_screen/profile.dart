import 'package:flutter/material.dart';
import 'package:nutritracker/includes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBar()),
      body: SingleChildScrollView(
        child: Center(
          child: DynamicButton(
              setText: "Logout",
              onClick: () async {
                await supabase.auth.signOut(scope: SignOutScope.local);
                newStackScreen(context, const WelcomeScreen());
              }),
        ),
      ),
    );
  }
}
