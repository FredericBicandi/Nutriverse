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
      backgroundColor: const Color(0xFFF1EDE9),
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xFFFCFBF8),
        title: const Text(
          "Profile",
          style: TextStyle(
              color: CupertinoColors.darkBackgroundGray,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        actions: [
          DynamicTextButton(
            onClick: () {},
            buttonIcon: Icons.settings_outlined,
            iconSize: 26,
            iconColor: 0xFF171717,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              width: 470,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFFCFBF8),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const ProfileSelector(
                setSize: 90,
                plusSize: 12,
                imageProfile: AssetImage("assets/images/Avatar_male.png")
                    as ImageProvider,
              ),
            ),
            Center(
              child: DynamicButton(
                  setText: "Logout",
                  onClick: () async {
                    await supabase.auth.signOut(scope: SignOutScope.local);
                    newStackScreen(context, const WelcomeScreen());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
