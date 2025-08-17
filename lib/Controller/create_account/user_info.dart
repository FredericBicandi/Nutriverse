import '../../Model/authentication_table/create_account.dart';
import 'package:intl/intl.dart';
import '.create_account.dart';
import '../../includes.dart';

String updateUserBmi(
  final String age,
  final String height,
  final String weight,
) {
  if (weight.isNotEmpty && height.isNotEmpty && isValidWeight && isValidHeight)
    return calculateBMI(
        age: int.tryParse(age) ?? 0,
        heightCm: double.tryParse(height) ?? 0.0,
        weightKg: double.tryParse(weight) ?? 0.0,
    );
  return '';
}

void createAccountHandler(
  BuildContext context,
  Function(bool) updateAge,
  Function(bool) updateHeight,
  Function(bool) updateWeight,
  Function(bool) updateLastName,
  Function(bool) updateFirstName,
  Function(bool) updateLoadingButton,
  Function(bool) updateGoalSelection,
) async {

  if (_checkFields(
    updateAge: updateAge,
    updateHeight: updateHeight,
    updateWeight: updateWeight,
    updateLastName: updateLastName,
    updateFirstName: updateFirstName,
    updateGoalSelection: updateGoalSelection,
    dateController: dateController,
    ageNumberController: ageNumberController,
    bmiNumberController: bmiNumberController,
  )) return;

  if (createAccountValidation(goal1, goal2, goal3)) {
    updateLoadingButton(true);

    int? response = await createUserAccount(imageFile, emailController.text, passwordController.text);
    if (response == 200) {
      await iosAlert(
        context,
        "Account Created Successfully!",
        "Your account has been created successfully.",
        true,
      );
      updateLoadingButton(false);
      return newStackScreen(context, const EmailVerification());
    }

    if (response == 301) {
      await iosAlert(context, "$errorMessage", "Make sure the image does not exceed 5(MB)",);
      return updateLoadingButton(false);
    }

    if (response == 400) {
      await iosAlert(context, "$errorMessage", "email might be already taken please restart the app and try again");
      return updateLoadingButton(false);
    }
    if (response == 500) {
      await iosAlert(context, "Unexpected Error!", "$errorMessage");
      return updateLoadingButton(false);
    }
  }
}

bool _checkFields({
  required Function(bool) updateFirstName,
  required Function(bool) updateLastName,
  required Function(bool) updateAge,
  required Function(bool) updateWeight,
  required Function(bool) updateHeight,
  required Function(bool) updateGoalSelection,
  required TextEditingController dateController,
  required TextEditingController ageNumberController,
  required TextEditingController bmiNumberController,
}) {
  String firstname = firstNameController.text;
  String weight = weightNumberController.text;
  String height = heightNumberController.text;
  String lastname = lastNameController.text;
  String age = ageNumberController.text;
  String date = dateController.text;
  String formattedDate;

  printDebugMsg("FETT");
  if (!validateName(firstname)) {
    updateFirstName(false);
    return true;
  }
  if (!validateName(lastname)) {
    updateLastName(false);
    return true;
  }

  if (date.isEmpty) {
    formattedDate = DateFormat('MM-dd-yyyy').format(DateTime.now());
    dateController.text = formattedDate;
    ageNumberController.text = "0";
    updateAge(false);
  } else if (!validateHeightWeight(weight)) {
    updateWeight(false);
    bmiNumberController.text = "0";
    return true;
  }

  if (!validateHeightWeight(height)) {
    updateHeight(false);
    bmiNumberController.text = "0";
    return true;
  }

  if (!validateAge(age)) {
    updateAge(false);
    return true;
  } else if (!goal1 && !goal2 && !goal3) updateGoalSelection(true);

  return false;
}
