import '../../Model/authentication_table/change_password.dart';
import '../../includes.dart';

Future<void> changePassword(
  BuildContext context,
  final String password,
  final String confirmedPassword,
  Function(bool) updatePasswordValidation,
  Function(bool) updatePasswordMatchValidation,
  Function(bool) updateLoadingButton,
) async {
  if (password.isEmpty || !validatePassword(password))
    return updatePasswordValidation(false);
  if (confirmedPassword.isEmpty ||
      !validatePasswordMatch(confirmedPassword, password))
    return updatePasswordMatchValidation(false);

  updateLoadingButton(true);
  int response = await updateUserPassword(emailController.text, password);
  if (response == 200) {
    await iosAlert(
      context,
      "Success",
      "you may now login to your account normally thank you!",
      true,
    );
    return newStackScreen(context, const WelcomeScreen());
  }

  printDebugMsg("couldn't change password! CHECK THE LOGS");
  await iosAlert(context, "Couldn't Update your password!", errorMessage!);
  return updateLoadingButton(false);
}
