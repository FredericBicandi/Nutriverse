import '../includes.dart';

Future<void> iosAlert(
  BuildContext originalContext,
  String title,
  String content, [
  bool positive = false,
]) {
  return showCupertinoDialog(
    context: originalContext,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title, style: const TextStyle(fontFamily: "Avenir")),
      content: Text(content, style: const TextStyle(fontFamily: "Avenir")),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Close",
            style: TextStyle(
              color: positive
                  ? CupertinoColors.activeBlue
                  : CupertinoColors.destructiveRed,
            ),
          ),
        )
      ],
    ),
  );
}
