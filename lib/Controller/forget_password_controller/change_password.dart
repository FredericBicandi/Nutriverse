import '../../Model/authentication_table/change_password.dart';
import '../../includes.dart';

Future <void> changePassword(
    BuildContext context,
    final String password,
    final String confirmedPassword,
    Function(bool) updateLoadingButton,
    ) async {

  if (isLoading) return;
  if (password.isEmpty || !isValidPassword) {
    isValidPassword = false;
    return;
  } else if (confirmedPassword.isEmpty || !isValidPasswordMatch) {
    isValidPasswordMatch = false;
    return;
  }
  updateLoadingButton(true);
  await request(context, password);
  updateLoadingButton(false);
}


Future<void> request(BuildContext context, final String password) async {

  int response = await updateUserPassword(emailController.text, password);
  if (response == 200) {
    await iosAlert(
      context,
      "Password has been changed successfully!",
      "you may now login to your account normally thank you!",
      true,
    );
    return newStackScreen(context, const WelcomeScreen());
  }

  printDebugMsg("couldn't change password! CHECK THE LOGS");
  return await iosAlert(context, "Couldn't Update your password!", errorMessage!,);
}
