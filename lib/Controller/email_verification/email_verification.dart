import 'package:nutritracker/Controller/create_account/.create_account.dart';

import '../../Model/users/update_user_email.dart';
import '../../includes.dart';

Future<void> changeEmail(
  BuildContext context,
  void Function(bool) updateIsValidEmail,
  void Function(bool) updateLoadingState,
  void Function(String value) updateEmailErrorText,
) async {
  final newEmail = emailController.text.trim();

  if (!validateEmail(newEmail)) return updateIsValidEmail(false);
  if (newEmail == oldEmail) return Navigator.pop(context);

  updateLoadingState(true);

  final int? res = await updateUserEmail(oldEmail, newEmail);
  if (res == 200) {
    oldEmail = newEmail;
    await supabase.auth.signOut(scope: SignOutScope.local);
    newStackScreen(context, const EmailVerification());
  } else if (res == 400) {
    emailErrorText = "Email Already Taken";
    updateEmailErrorText(emailErrorText);
    updateIsValidEmail(false);
  } else {
    await iosAlert(
      context,
      "Error!",
      (errorMessage?.isNotEmpty ?? false) ? errorMessage! : "Unknown error.",
    );
  }

  updateLoadingState(false);
}
