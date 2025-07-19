import '../includes.dart';

// ignore: must_be_immutable
class DynamicButton extends StatefulWidget {
  DynamicButton({
    super.key,
    this.setIcon,
    this.setSize = 160,
    this.isLoading = false,
    this.bgColor = 0xFF1AB394,
    this.textColor = 0xFFFFFFFF,
    this.borderColor = 0x00000000,
    required this.setText,
    required this.onClick,
  });

  int bgColor, textColor, borderColor;
  double setSize;

  final bool isLoading;
  final String setText;
  final IconData? setIcon;

  final Function()? onClick;

  @override
  State<DynamicButton> createState() => _DynamicButtonState();
}

class _DynamicButtonState extends State<DynamicButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.setSize,
      height: 40,
      decoration: BoxDecoration(
        color: widget.isLoading ? Color(fade) : Color(widget.bgColor),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Color(widget.borderColor),
          width: 0.5, // adjust width if needed
        ),
      ),
      child: widget.isLoading
          ? CupertinoActivityIndicator(color: Color(secondaryColor))
          : CupertinoButton(
              onPressed: widget.onClick,
              sizeStyle: CupertinoButtonSize.small,
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.setText,
                    style: TextStyle(
                      fontFamily: "Avenir",
                      color: Color(widget.textColor),
                    ),
                  ),
                  if (widget.setIcon != null) ...[
                    const SizedBox(width: 5),
                    Icon(
                      widget.setIcon,
                      color: CupertinoColors.white,
                    ),
                  ],
                ],
              ),
            ),
    );
  }
}
