import '../includes.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key, this.dashboard = false});

  final bool dashboard;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: dashboard ? 80 : 0),
          child: SvgPicture.asset(
            "assets/images/NutriTracker.svg",
            colorFilter: ColorFilter.mode(
              Color(primaryColor),
              BlendMode.srcIn,
            ),
            width: dashboard ? 40 : 30,
            height: dashboard ? 40 : 30,
          ),
        ),
        if (!dashboard)
          Text(
            "nutriTracker",
            style: TextStyle(
              fontSize: 15,
              color: Color(primaryColor),
              letterSpacing: 1.4,
            ),
          )
      ],
    );
  }
}
