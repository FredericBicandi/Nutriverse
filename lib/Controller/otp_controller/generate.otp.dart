import '../../Model/edge_functions/send_emails.dart';
import '../../includes.dart';
import '.otp.dart';

Future<void> generateOTP(final String email) async {

  otp = List.generate(4, (_) => Random().nextInt(10)).join();
  otp = otp.toString();
  emailTo = email;
  alreadySent = true;
  printDebugMsg("OTP=$otp");
  await SendEmail().otp(email, otp);
}

void resendOTP(BuildContext context) async {
  generateOTP(emailController.text);
  remainingSeconds = 100;
  return newStackScreen(context, const VerifyOtp());
}
