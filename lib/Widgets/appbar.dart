import '../View/profile_screen/profile.dart';
import '../includes.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
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
            width: sizeOf(context, 0.60), child: const Center(child: Appbar())),
        ImageButton(
          onClick: () => navigateTo(context, const ProfileScreen()),
          urlImage: imageUrl == null ? false : true,
          imagePath: imageUrl ?? "Avatar_male.png",
        )
      ],
    );
  }
}
