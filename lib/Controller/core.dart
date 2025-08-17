import 'package:flutter/material.dart' as material;
import '../includes.dart';

// Color Schema
int scaffoldColor = 0xFFFFFFFF;
int primaryColor = 0xFF1AB394;
int secondaryColor = 0xFF0A483B;
int accentColor = 0xCB8CD1CA;
int outline = 0xFFEEEEEE;
int fade = 0xF4C2C2C2;

int currentSeconds = 100;
int remainingSeconds = 100;
final RegExp namingRegEx = RegExp(r'[a-zA-Z\s]');
final RegExp measuresRegEx = RegExp(r'^\d*\.?\d{0,2}');
final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
final RegExp passwordRegex = RegExp(r'[a-zA-Z0-9!@#\$%^&*(),.?":{}|<>_\-]');
final RegExp otpRegex = RegExp(r'^\d$');

Timer? timer;

bool validateName(String name) => name.length >= 2;
bool validateEmail(String email) => emailRegex.hasMatch(email);
bool validateOtp(String otp) => otpRegex.hasMatch(otp);
bool validateHeightWeight(String value) {
  double? data = double.tryParse(value);
  return data != null && data >= 35 && data <= 200;
}

bool validateAge(String value) {
  int? data = int.tryParse(value);
  return data != null && data >= 10 && data <= 90;
}

bool validatePassword(String password) =>
    password.length >= 8 && passwordRegex.hasMatch(password);
bool validatePasswordMatch(String passwordMatch, String password) =>
    passwordMatch == password;

// ignore: avoid_print
void printDebugMsg(String msg) => kDebugMode ? print("DEBUG $msg") : null;
void dismissKeyboard(BuildContext context) => FocusScope.of(context).unfocus();
void navigateTo(BuildContext context, Widget screen) =>
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (BuildContext context) => screen),
    );
void newStackScreen(BuildContext context, Widget screen) =>
    Navigator.pushAndRemoveUntil(
        context,
        material.MaterialPageRoute(builder: (_) => screen),
        (Route<dynamic> route) => false);

double sizeOf(BuildContext context, double times) =>
    MediaQuery.of(context).size.width * times;

Future<void> navigateToActionSheet(
  BuildContext context,
  Widget Function() sheet,
) =>
    showCupertinoSheet<void>(
      context: context,
      useNestedNavigation: false,
      // ignore: deprecated_member_use
      pageBuilder: (BuildContext context) => sheet(),
    );

void disposeTimer() => timer?.cancel();
void startTimer(Function(int) onTick) {
  timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    if (remainingSeconds <= 0) {
      timer.cancel();
    } else {
      remainingSeconds--;
      onTick(remainingSeconds);
    }
  });
}
