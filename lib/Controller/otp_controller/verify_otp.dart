import '../../Model/verified_users/update_verification.dart';
import '../../Model/authentication_table/get_user_by_email.dart';
import '../../includes.dart';
import 'generate.otp.dart';
import '.otp.dart';

bool verifyOtpNumber(String value) => otpRegex.hasMatch(value);
String _collectOtp() => '${otpController1.text}${otpController2.text}${otpController3.text}${otpController4.text}';

Future<void> verify(
  BuildContext context,
  void Function(bool) setOtp1Valid,
  void Function(bool) setOtp2Valid,
  void Function(bool) setOtp3Valid,
  void Function(bool) setOtp4Valid,
  void Function(bool) setLoading,
) async {

  final entered = _collectOtp();

  // Basic format validation
  final isFourDigits = RegExp(r'^\d{4}$').hasMatch(entered);
  if (!isFourDigits) {
    setOtp1Valid(false);
    setOtp2Valid(false);
    setOtp3Valid(false);
    setOtp4Valid(false);
    printDebugMsg('Invalid OTP format');
    return;
  }

  // Compare with the expected OTP
  if (entered != otp) {
    setOtp1Valid(false);
    setOtp2Valid(false);
    setOtp3Valid(false);
    setOtp4Valid(false);
    printDebugMsg('OTP not verified');
    return;
  }

  // Success path
  setLoading(true);
  try {
    if (emailVerification) {
      await verifyUser(emailController.text.trim());
      if (!context.mounted) return;
    }

    newStackScreen(
      context,
      emailVerification ? const Dashboard() : const PasswordReset(),
    );
  } catch (e) {
    if (!context.mounted) return;
    await iosAlert(context, 'Error', e.toString());
  } finally {
    // Only stop loading if we're still on this page
    if (context.mounted) setLoading(false);
  }
}

Future<void> verification(
  BuildContext context,
  void Function(String) setMessage,
  void Function(bool) setLoading,
  void Function(bool) setEmailStatus,
) async {

  final email = emailController.text.trim();

  // If OTP already sent for same email and timer still active → go directly
  if (alreadySent && emailTo == email && remainingSeconds > 0) {
    if (!context.mounted) return;
    return navigateTo(context, const VerifyOtp());
  }

  setLoading(true);
  final code = await findUser(email);
  if (code == 404) {
    setMessage('User not found!');
    setLoading(false);
    return setEmailStatus(false);
  }

  if (code == 200) {
    setMessage('We sent you a 4-digit code.');
    setEmailStatus(true);
  } else {
    if (!context.mounted) return;
    return await iosAlert(context, 'Unknown Error', errorMessage!);
  }

  await generateOTP(email);
  alreadySent = true;
  emailTo = email;

  if (!context.mounted) return;
  navigateTo(context, const VerifyOtp());

  return setLoading(false);
}
