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
    if (info == null) return iosAlert(context, "Unexcepted Error", errorMessage!);
    userInfo = info;
    imageUrl = userInfo['photo'];

    // checks for email if verified
    final int? response = await checkVerification(email);
    if (response == 404) return newStackScreen(context, const EmailVerification());
    if (response == 500) return await iosAlert(context, "Error", errorMessage!);

    return newStackScreen(context, const Dashboard());
  }

  if (success == 500) return await iosAlert(context, "Error!", errorMessage!);
  updatePasswordValidity(false);
  return updateLoadingButton(false);
}
