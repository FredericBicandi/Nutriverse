import '../../Model/users/update_user_email.dart';
import '../../includes.dart';

Future<void> changeEmail(
  BuildContext context,
  Function(bool) updateIsValidEmail,
  Function(bool) updateLoadingState,
) async {
  if (!validateEmail(emailController.text)) {
    updateIsValidEmail(false);
    return;
  }
  if (oldEmail == emailController.text) {
    return newStackScreen(
      context,
      const EmailVerification(),
    );
  }
  printDebugMsg("Same email skipping...");
  updateLoadingState(true);
  final int? response = await updateUserEmail(
    oldEmail,
    emailController.text,
  );
  if (response != 200) {
    updateLoadingState(false);
    return await iosAlert(
      // ignore: use_build_context_synchronously
      context,
      "Error!",
      errorMessage!,
    );
  }
  newStackScreen(
    // ignore: use_build_context_synchronously
    context,
    const EmailVerification(),
  );
}
