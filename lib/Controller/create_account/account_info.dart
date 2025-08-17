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
    isValidPasswordMatch =
        validatePasswordMatch(confirmPasswordController.text, value);
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

Future<void> nextPageHandler(
  BuildContext context,
  Function(bool) updateLoadingButton,
  Function(bool) updateEmailValid,
  Function(bool) updatePasswordValid,
  Function(bool) updatePasswordMatch,
) async {

 final String email = emailController.text.toLowerCase();
 final String password = passwordController.text;
 final String confPassword = confirmPasswordController.text;

  // check field values
  if (!validateEmail(email) || email.isEmpty) return updateEmailValid(false);
  else if (password.isEmpty || !validatePassword(password)) return updatePasswordValid(false);
  else if (confPassword.isEmpty || !validatePasswordMatch(confPassword, password)) return updatePasswordMatch(false);


  updateLoadingButton(true);

  // checks if email already taken
  int? response = await findUser(emailController.text);
  if (response == 404) {
    updateLoadingButton(false);
    return navigateTo(context, const UserInfo());
  }

  if (response == 200) {
    emailErrorText = "Email is already taken";
    updateLoadingButton(false);
    return updateEmailValid(false);
  }

  if (response == 500) {
    await iosAlert(context, "Unknown Error!", "$errorMessage");
    return updateLoadingButton(false);
  }
}
