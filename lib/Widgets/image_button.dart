import '../includes.dart';
import 'package:flutter/material.dart' as material;

class ImageButton extends StatefulWidget {
  const ImageButton({
    super.key,
    this.setText,
    this.imagePath,
    required this.onClick,
  });

  final String? setText;
  final String? imagePath;
  final Function()? onClick;

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: widget.onClick,
      child: material.CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage("assets/images/${widget.imagePath}"),
      ),
    );
  }
}
