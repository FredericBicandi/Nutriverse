import '../../Model/authentication_table/get_user_by_email.dart';
import '../../includes.dart';
import '.create_account.dart';

// CreateAccountScreen Logic
void emailHandler(String value, Function(bool) updateEmailValid) {
  emailErrorText = "Invalid Email";
  updateEmailValid(validateEmail(value));
  isValidEmail
      ? updateUserInfo("Email", value.toLowerCase())
      : updateUserInfo("Email", null);
}

void passwordHandler(String value) {
  if (confirmPasswordController.text.isNotEmpty) {
    isValidPasswordMatch = validatePasswordMatch(confirmPasswordController.text, value);
  }
  isValidPassword = validatePassword(value);
  isValidPassword && isValidPasswordMatch
      ? updateUserInfo("Password", value)
      : updateUserInfo("Password", null);
}

void confirmPasswordHandler(String value, Function(bool) updatePasswordMatch) {
  if (confirmPasswordController.text.isNotEmpty) {
    updatePasswordMatch(validatePasswordMatch(
      value,
      passwordController.text,
    ));
    isValidPasswordMatch && isValidPassword
        ? updateUserInfo("Password", value)
        : updateUserInfo("Password", null);
  }
}

void nextPageHandler(
  BuildContext context,
  Function(bool) updateLoadingButton,
  Function(bool) updateEmailValid,
  Function(bool) updatePasswordValid,
  Function(bool) updatePasswordMatch,
) async {
  if (!validateEmail(emailController.text.toLowerCase()) ||
      emailController.text.isEmpty) {
    updateEmailValid(false);
    return;
  } else if (passwordController.text.isEmpty ||
      !validatePassword(passwordController.text)) {
    updatePasswordValid(false);
    return;
  } else if (confirmPasswordController.text.isEmpty ||
      !validatePasswordMatch(
        confirmPasswordController.text,
        passwordController.text,
      )) {
    updatePasswordMatch(false);
    return;
  }

  updateLoadingButton(true);
  int? response = await findUser(emailController.text);
  if (response == 404) {
    // ignore: use_build_context_synchronously
    updateLoadingButton(false);
    // ignore: use_build_context_synchronously
    return navigateTo(context, const UserInfo());
  } else if (response == 200) {
    emailErrorText = "Email is already taken";
    updateLoadingButton(false);
    updateEmailValid(false);
    return;
  } else if (response == 500) {
    // ignore: use_build_context_synchronously
    await iosAlert(
      // ignore: use_build_context_synchronously
      context,
      "Unknown Error!",
      "Check Your Internet Connection And Try Again",
    );
    updateLoadingButton(false);
    return;
  }
}
