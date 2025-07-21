import '../View/profile_screen/profile.dart';
import '../includes.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
    this.left = 60,
  });

  final double left;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: left),
          child: SvgPicture.asset(
            "assets/images/NutriTracker.svg",
            colorFilter: ColorFilter.mode(
              Color(primaryColor),
              BlendMode.srcIn,
            ),
            width: 30,
            height: 30,
          ),
        ),
        Text(
          "nutriTracker",
          style: TextStyle(
            fontSize: 15,
            color: Color(primaryColor),
            letterSpacing: 1.4,
          ),
        ),
      ],
    );
  }
}

class ExtendedAppBar extends StatelessWidget {
  const ExtendedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
            width: sizeOf(context, 0.60),
            child: const Center(child: Appbar(left: 60))),
        ImageButton(
          onClick: () => navigateTo(context, const ProfileScreen()),
          urlImage: imageUrl == null ? false : true,
          imagePath: imageUrl ?? "Avatar_male.png",
        )
      ],
    );
  }
}
