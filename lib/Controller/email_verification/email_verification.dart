import '../../Model/users/update_user_email.dart';
import '../../includes.dart';

Future<void> changeEmail(
  BuildContext context,
  void Function(bool) updateIsValidEmail,
  void Function(bool) updateLoadingState,
) async {
  final newEmail = emailController.text.trim();

  if (!validateEmail(newEmail)) {
    updateIsValidEmail(false);
    return;
  }

  if (newEmail == oldEmail) {
    return Navigator.pop(context);
  }
  updateLoadingState(true);
  try {
    final int? res = await updateUserEmail(oldEmail, newEmail); // your API

    if (res == 200) {
      // IMPORTANT: keep your local state consistent for the next attempt
      oldEmail = newEmail; // or reload user profile instead

      // Proceed to verification (if your flow requires it)
      // ignore: use_build_context_synchronously
      newStackScreen(context, const EmailVerification());
    } else {
      await iosAlert(
        // ignore: use_build_context_synchronously
        context,
        "Error!",
        (errorMessage?.isNotEmpty ?? false) ? errorMessage! : "Unknown error.",
      );
    }
  } catch (e) {
    // ignore: use_build_context_synchronously
    await iosAlert(context, "Error!", e.toString());
  } finally {
    updateLoadingState(false);
  }
}
