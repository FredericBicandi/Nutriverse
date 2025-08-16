import '../../Model/verified_users/update_verification.dart';
import '../../Model/authentication_table/get_user_by_email.dart';
import '../../includes.dart';
import 'generate.otp.dart';
import '.otp.dart';

// ---------- OTP helpers (drop-in rewrites) ----------

// Returns true if a single OTP char is valid (0–9).
bool verifyOtpNumber(String value) => otpRegex.hasMatch(value);
// Collect the 4-digit OTP from your 4 controllers.
String _collectOtp() =>
    '${otpController1.text}${otpController2.text}${otpController3.text}${otpController4.text}';

// Verifies the entered OTP. Safely handles async + navigation.
Future<void> verify(
    BuildContext context, // DO NOT store this; only use it when mounted
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
      if (!context.mounted) return; // page might have been popped
    }

    // Navigate and STOP touching state on this page afterwards
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

// Starts/continues the email → OTP flow.
// - Avoids re-sending if we already sent an OTP for the same email and the timer is active.
// - Never updates state after navigation.
// - Uses defensive mounted checks.
Future<void> verification(
    BuildContext context,
    void Function(String) setMessage,
    void Function(bool) setLoading,
    void Function(bool) setEmailStatus, // true = looks valid/exists
    ) async {
  final email = emailController.text.trim();

  // If OTP already sent for same email and timer still active → go directly
  if (alreadySent && emailTo == email && remainingSeconds > 0) {
    if (!context.mounted) return;
    navigateTo(context, const VerifyOtp());
    return;
  }

  setLoading(true);
  try {
    final code = await findUser(email); // your backend check

    if (code == 404) {
      setMessage('User not found!');
      setEmailStatus(false);
      return; // keep user on same screen
    }

    if (code == 200) {
      // Email exists / acceptable for OTP
      setMessage('We sent you a 4-digit code.');
      setEmailStatus(true);
    } else {
      if (!context.mounted) return;
      await iosAlert(
        context,
        'Unknown Error',
        'Make sure you are connected to the internet and try again!',
      );
      return;
    }

    // Generate and send OTP
    await generateOTP(email);
    alreadySent = true;
    emailTo = email;

    if (!context.mounted) return;
    navigateTo(context, const VerifyOtp());
  } catch (e) {
    if (!context.mounted) return;
    await iosAlert(context, 'Error', e.toString());
  } finally {
    if (context.mounted) setLoading(false);
  }
}
