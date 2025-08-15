import '../includes.dart';

class Footer extends StatelessWidget {
  Footer({this.setHeight = 200, super.key});

  double setHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: setHeight),
        const Text(
          "©2025 All Rights Reserved",
          style: TextStyle(fontSize: 10, color: CupertinoColors.inactiveGray),
        ),
      ],
    );
  }
}
