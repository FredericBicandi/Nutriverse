import '../../includes.dart';

int color=fade;
late String otp;
String emailTo = '';
bool otp1Valid = true;
bool otp2Valid = true;
bool otp3Valid = true;
bool otp4Valid = true;
bool alreadySent = false;
final focusNode1 = FocusNode();
final focusNode2 = FocusNode();
final focusNode3 = FocusNode();
final focusNode4 = FocusNode();
TextEditingController otpController1 = TextEditingController();
TextEditingController otpController2 = TextEditingController();
TextEditingController otpController3 = TextEditingController();
TextEditingController otpController4 = TextEditingController();

void resetOtpFields() {
  disposeTimer();
  isLoading = false;
  otp1Valid = true;
  otp2Valid = true;
  otp3Valid = true;
  otp4Valid = true;
  otpController1.text = '';
  otpController2.text = '';
  otpController3.text = '';
  otpController4.text = '';
}
