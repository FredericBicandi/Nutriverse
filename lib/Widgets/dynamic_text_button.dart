import 'package:flutter/material.dart';
import '../includes.dart';

// ignore: must_be_immutable
class DynamicTextButton extends StatelessWidget {
  DynamicTextButton({
    super.key,
    this.iconSize = 20,
    this.iconColor = 0xF4C2C2C2,
    this.textColor = 0xFF1AB394,
    this.image,
    this.buttonText,
    this.buttonIcon,
    required this.onClick,
  });

  int iconColor,textColor;
  final double iconSize;

  final dynamic image;
  final dynamic buttonIcon;
  final dynamic buttonText;

  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onClick,
      sizeStyle: CupertinoButtonSize.small,
      child: buttonText != null
          ? Text(
              buttonText,
              style: TextStyle(
                fontFamily: "Avenir",
                color: Color(textColor),
                decoration: TextDecoration.none,
              ),
            )
          : buttonIcon != null
              ? Icon(
                  buttonIcon,
                  color: Color(iconColor),
                  size: iconSize,
                )
              : CircleAvatar(
                  radius: 100,
                  backgroundColor: Color(outline),
                  backgroundImage: image,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(primaryColor),
                      child: const Icon(
                        Icons.edit,
                        color: CupertinoColors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
    );
  }
}
