import '../includes.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        "©2025 All Rights Reserved",
        style: TextStyle(fontSize: 10, color: CupertinoColors.inactiveGray),
      ),
    );
  }
}