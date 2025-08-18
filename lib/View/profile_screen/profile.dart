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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 2,
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: const Color(0xFFFCFBF8),
          title: const Text(
            "Profile",
            style: TextStyle(
              color: CupertinoColors.darkBackgroundGray,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              width: 380,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFFCFBF8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.100),
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileSelector(
                      setSize: 110,
                      plusSize: 12,
                      imageProfile: userInfo['photo'] != null
                          ? NetworkImage("$imageUrl")
                          : AssetImage("assets/images/$imageUrl") as ImageProvider),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${userInfo['name']}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text("${userInfo['age']} years",
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
            Container(width: 346, height: 0.1, color: CupertinoColors.black),
            Container(
              width: 380,
              height: 180,
              decoration: BoxDecoration(
                color: const Color(0xFFFCFBF8),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.100),
                    blurRadius: 8, // softness
                    spreadRadius: 0, // no extra spread
                    offset: const Offset(0, 5), // only at the bottom
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Current weight",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "${userInfo['weight']} kg",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Goal",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "${userInfo['goal']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Active Diet Plan",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "${userInfo['diet_plan']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "CUSTOMIZATION",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            Container(
              width: 380,
              height: 355,
              decoration: BoxDecoration(
                color: const Color(0xFFFCFBF8),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.100),
                    blurRadius: 8, // softness
                    spreadRadius: 0, // no extra spread
                    offset: const Offset(0, 5), // only at the bottom
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileOptions(
                    onClick: () {},
                    setIcons: Icons.person_outline,
                    setText: "Personal details",
                  ),
                  Container(
                      width: 346, height: 0.1, color: CupertinoColors.black),
                  ProfileOptions(
                    onClick: () {},
                    setIcons: Icons.food_bank_outlined,
                    setText: "Adjust macronutrients",
                  ),
                  Container(
                      width: 346, height: 0.1, color: CupertinoColors.black),
                  ProfileOptions(
                    onClick: () {},
                    setIcons: Icons.fastfood_outlined,
                    setText: "Adjust calories",
                  ),
                  Container(
                      width: 346, height: 0.1, color: CupertinoColors.black),
                  ProfileOptions(
                    onClick: () {},
                    setIcons: Icons.emoji_food_beverage_outlined,
                    setText: "Dietary needs",
                  ),
                  Container(
                      width: 346, height: 0.1, color: CupertinoColors.black),
                  ProfileOptions(
                    onClick: () {},
                    setIcons: Icons.water_drop_outlined,
                    setText: "Adjust macronutrients",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: Center(
                child: DynamicButton(
                    setText: "Save",
                    onClick: () async {
                      Navigator.pop(context);
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: DynamicButton(
                onClick: () async {
                  userInfo = {};
                  user = null;
                  session = null;
                  await supabase.auth.signOut(scope: SignOutScope.local);
                  newStackScreen(context, const WelcomeScreen());

                },
                setSize: 170,
                setText: 'Logout',
                bgColor: 0x00FFFFF,
                textColor: 0xfffa6c61,
                borderColor: 0xfffa6c61,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
