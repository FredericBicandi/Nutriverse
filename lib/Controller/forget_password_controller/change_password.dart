import '../../Model/authentication_table/change_password.dart';
import '../../includes.dart';

void changePassword(
  BuildContext context,
  final String password,
  final String confirmedPassword,
) {
  if (isLoading) return;
  if (password.isEmpty || !isValidPassword) {
    isValidPassword = false;
    return;
  } else if (confirmedPassword.isEmpty || !isValidPasswordMatch) {
    isValidPasswordMatch = false;
    return;
  }
  request(context, password);
}

/*
*   request
*   @PARAM context,Password
*   Description:
*       Takes the password entered to change it
*   RETURN (void);
* */
Future<void> request(BuildContext context, final String password) async {
  isLoading = true;
  int response = await updateUserPassword(emailController.text, password);
  if (response == 200) {
    printDebugMsg("password has been changed Successfully");
    await iosAlert(
      // ignore: use_build_context_synchronously
      context,
      "Password has been changed successfully!",
      "you may now login to your account normally thank you!",
      true,
    );
    // ignore: use_build_context_synchronously
    return newStackScreen(context, const WelcomeScreen());
  } else {
    printDebugMsg("couldn't change password! CHECK THE LOGS");
    await iosAlert(
      // ignore: use_build_context_synchronously
      context,
      "Couldn't Update your password!",
      "Check your internet connection and try again!",
    );
    isLoading = false;
  }
}
