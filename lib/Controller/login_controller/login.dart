import 'package:nutritracker/Model/users/get_user_info.dart';

import '../../Model/authentication_table/auth_login.dart';
import '../../Model/verified_users/check_verification.dart';
import '../../includes.dart';

Future<void> loginController(
  BuildContext context,
  Function(bool) updateEmailValidity,
  Function(bool) updatePasswordValidity,
  Function(bool) updateLoadingButton,
) async {
  final String email = emailController.text;
  final String password = passwordController.text;
  final bool emptyEmail = email.isEmpty;
  final bool emptyPassword = password.isEmpty;

  // Validate input
  if (emptyEmail || !isValidEmail || !validateEmail(email)) {
    updateEmailValidity(false);
    return;
  }
  if (emptyPassword) {
    updatePasswordValidity(false);
    return;
  }

  updateLoadingButton(true);
  try {
    final int success = await userAuth(email, password);
    if (success == 200) {
      printDebugMsg("Authentication Success");
      updatePasswordValidity(true);
      final info=await getUserInfo()!;
      if(info==null) {
        return iosAlert(context, "Unexcepted Error", errorMessage!);
      }
      userInfo=info!;
      imageUrl=userInfo['photo'];
      printDebugMsg("Got user data =>$userInfo");
      // ignore: use_build_context_synchronously
      final int? response = await checkVerification(emailController.text);
      if (response == 404) {
        // ignore: use_build_context_synchronously
        return newStackScreen(context, const EmailVerification());
      } else if (response == 500) {
        // ignore: use_build_context_synchronously
        await iosAlert(context, "Error", errorMessage!);
      }
      // ignore: use_build_context_synchronously
      return newStackScreen(context, const Dashboard());
    } else if (success == 500) {
      await iosAlert(
        // ignore: use_build_context_synchronously
        context,
        "Unknown Error!",
        "Check Your Internet Connection And Try Again",
      );
    } else {
      printDebugMsg(
          "incorrect password for => email:$email password:$password");
      updatePasswordValidity(false);
    }
  } finally {
    // Always reset loading to false
    updateLoadingButton(false);
  }
}
