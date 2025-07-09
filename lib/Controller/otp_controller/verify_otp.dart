import '../../Model/authentication_table/get_user_by_email.dart';
import '../../includes.dart';
import '../forget_password_controller/forget_password.dart';
import 'generate.otp.dart';

void verifyOtpNumbers(String value, bool valid) =>
    !validateOtp(value) ? valid = false : valid = true;
void verify(
  BuildContext context,
  Function(bool) updateOtp1Validity,
  Function(bool) updateOtp2Validity,
  Function(bool) updateOtp3Validity,
  Function(bool) updateOtp4Validity,
  Function(bool) loadingState,
) async {
  final String otpEntered =
      "${otpController1.text}${otpController2.text}${otpController3.text}${otpController4.text}";

  printDebugMsg("otpEntered=>$otpEntered");
  if (otpEntered == otp) {
    loadingState(true);
    printDebugMsg("Verified");
    // ignore: use_build_context_synchronously
    return newStackScreen(context, const PasswordReset());
  } else {
    updateOtp1Validity(false);
    updateOtp2Validity(false);
    updateOtp3Validity(false);
    updateOtp4Validity(false);
    return printDebugMsg("not Verified");
  }
}

void verification(
  BuildContext context,
  Function(String) updateMessage,
  Function(bool) updateLoading,
  Function(bool) updateEmailStatus,
) async {
  final String currentEmail = emailController.text;

  // Only navigate if an OTP was already sent, to the same email, and timer is still active
  if (alreadySent && emailTo == currentEmail && remainingSeconds > 0) {
    return navigateTo(context, const VerifyOtp());
  }

  // Proceed to generate and send new OTP
  updateLoading(true);
  final int response = await findUser(currentEmail);

  if (response == 404) {
    updateMessage("User not found!");
    updateEmailStatus(false);
    updateLoading(false);
    return;
  } else if (response == 200) {
    updateMessage("Invalid Email!");
    updateEmailStatus(true);
  } else {
    updateLoading(false);
    await iosAlert(
      // ignore: use_build_context_synchronously
      context,
      "Unknown Error",
      "Make sure you are connected to the internet and try again!",
    );
    return;
  }

  // // Generate new OTP and send
  await generateOTP(currentEmail);
  updateLoading(false);
  // ignore: use_build_context_synchronously
  return navigateTo(context, const VerifyOtp());
}

