import '../includes.dart';
import 'package:flutter/material.dart';

class ProfileOptions extends StatefulWidget {
  const ProfileOptions({
    super.key,
    required this.setIcons,
    required this.setText,
    required this.onClick,
  });

  final IconData setIcons;
  final String setText;
  final Function()? onClick;

  @override
  State<ProfileOptions> createState() => _ProfileOptionsState();
}

class _ProfileOptionsState extends State<ProfileOptions> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => widget.onClick,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(widget.setIcons, color: Color(primaryColor)),
            const SizedBox(width: 9),
            Expanded(
              child: Text(
                widget.setText,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Icon(
                size: 14,
                color: Colors.grey,
                Icons.arrow_forward_ios_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
