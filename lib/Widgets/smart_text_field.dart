import 'package:flutter/material.dart';
import '../includes.dart';

class _SmartTextFieldState extends State<SmartTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      color: CupertinoColors.white,
      child: TextField(
        onTap: widget.onTap,
        onChanged: (value) => widget.onChangeFunction!(value),
        readOnly: widget.readOnly,
        focusNode: widget.focusNode,
        autocorrect: widget.autoCorrect,
        obscureText: widget.obscureText,
        controller: widget.controllerName,
        enableSuggestions: widget.enableSuggestions,
        cursorColor: Color(accentColor),
        textAlignVertical: TextAlignVertical.center,
        cursorErrorColor: CupertinoColors.destructiveRed,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        inputFormatters: [
          widget.filterTextInput ??
              FilteringTextInputFormatter.singleLineFormatter,
          LengthLimitingTextInputFormatter(widget.maxLen)
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: widget.labelText,
          errorText: widget.isValidInput ? null : widget.errorText,
          errorStyle: const TextStyle(
            color: CupertinoColors.destructiveRed,
            fontSize: 13,
            wordSpacing: 1.2,
          ),
          labelStyle: TextStyle(
            color: widget.isValidInput
                ? CupertinoColors.inactiveGray
                : CupertinoColors.destructiveRed,
            fontSize: 16,
            letterSpacing: 2.5,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: widget.isValidInput
                  ? CupertinoColors.white
                  : CupertinoColors.destructiveRed,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: widget.isValidInput
                  ? Color(accentColor)
                  : CupertinoColors.destructiveRed,
              width: 1,
            ),
          ),
          prefixIcon: widget.iconName != null
              ? Icon(widget.iconName, color: Color(accentColor), size: 20)
              : null,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SmartTextField extends StatefulWidget {
  SmartTextField({
    super.key,
    this.width = 350,
    this.maxLen = 80,
    this.readOnly = false,
    this.autoCorrect = true,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.onTap,
    this.focusNode,
    this.iconName,
    this.keyboardType,
    this.textInputAction,
    this.filterTextInput,
    this.onChangeFunction,
    required this.labelText,
    required this.errorText,
    required this.isValidInput,
    required this.controllerName,
  });


  double width;
  int maxLen;

  bool readOnly;
  bool autoCorrect;
  bool obscureText;
  bool enableSuggestions;
  final bool isValidInput;

  final String labelText;
  final String errorText;

  final dynamic iconName;
  final dynamic focusNode;

  final dynamic keyboardType;
  final dynamic controllerName;
  final dynamic textInputAction;
  final dynamic filterTextInput;

  final Function()? onTap;
  final Function(String)? onChangeFunction;

  @override
  State<SmartTextField> createState() => _SmartTextFieldState();
}
