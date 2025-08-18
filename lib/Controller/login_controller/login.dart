import '../../includes.dart';
import '../../Model/users/get_user_info.dart';
import '../../Model/authentication_table/auth_login.dart';
import '../../Model/verified_users/check_verification.dart';

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

  if (emptyEmail || !isValidEmail || !validateEmail(email)) return updateEmailValidity(false);
  if (emptyPassword) return updatePasswordValidity(false);

  // Start loading button
  updateLoadingButton(true);

  // login to database
  final int success = await userAuth(email, password);
  if (success == 200) {
    updatePasswordValidity(true);

    // loads all user info
    final info = await getUserInfo(email);
    userInfo = info!;
    imageUrl = userInfo['photo'];

    return newStackScreen(context, const AuthScreen());
  }
  if(success==401) updatePasswordValidity(false);
  if (success == 500) await iosAlert(context, "Error", errorMessage!);
  return updateLoadingButton(false);
}
