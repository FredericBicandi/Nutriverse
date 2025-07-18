import '../../Model/authentication_table/create_account.dart';
import 'package:intl/intl.dart';
import '.create_account.dart';
import '../../includes.dart';

String updateUserBmi(
  final String age,
  final String height,
  final String weight,
) {
  if (weightNumberController.text.isNotEmpty &&
      heightNumberController.text.isNotEmpty &&
      isValidWeight &&
      isValidHeight) {
    return calculateBMI(
        age: int.tryParse(age) ?? 0,
        heightCm: double.tryParse(height) ?? 0.0,
        weightKg: double.tryParse(weight) ?? 0.0);
  }
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
  )) {
    return;
  }

  printDebugMsg("passed Field Validations");
  if (createAccountValidation(
    goal1,
    goal2,
    goal3,
  )) {
    printDebugMsg("passed INFO Validations!");
    updateLoadingButton(true);
    printDebugMsg("Creating Account");
    int? response = await createUserAccount(
      imageFile,
      emailController.text,
      passwordController.text,
    );
    printDebugMsg("Response => $response ");
    if (response == 200) {
      await iosAlert(
        // ignore: use_build_context_synchronously
        context,
        "Account Created Successfully!",
        "Your account has been created successfully.",
        true,
      );
      updateLoadingButton(false);
      // ignore: use_build_context_synchronously
      navigateTo(context, const EmailVerification());
      return;
    }
    if (response == 301) {
      await iosAlert(
        // ignore: use_build_context_synchronously
        context,
        "$errorMessage",
        "Make sure the image does not exceed 5(MB)",
      );
      updateLoadingButton(false);
      return;
    }
    if (response == 400) {
      await iosAlert(
        // ignore: use_build_context_synchronously
        context,
        "$errorMessage",
        "email might be already taken please restart the app and try again",
      );
      updateLoadingButton(false);
      return;
    }
    if (response == 500) {
      await iosAlert(
        // ignore: use_build_context_synchronously
        context,
        "Unexpected Error!",
        "$errorMessage",
      );
      updateLoadingButton(false);
      return;
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
  if (!validateName(firstNameController.text)) {
    updateFirstName(false);
    return true;
  } else if (!validateName(lastNameController.text)) {
    updateLastName(false);
    return true;
  } else if (dateController.text.isEmpty) {
    String formattedDate = DateFormat('MM-dd-yyyy').format(DateTime.now());
    dateController.text = formattedDate;
    ageNumberController.text = "0";
    updateAge(false);
  } else if (!validateHeightWeight(weightNumberController.text)) {
    updateWeight(false);
    bmiNumberController.text = "0";
    return true;
  } else if (!validateHeightWeight(heightNumberController.text)) {
    updateHeight(false);
    bmiNumberController.text = "0";
    return true;
  } else if (!validateAge(ageNumberController.text)) {
    updateAge(false);
    return true;
  } else if (!goal1 && !goal2 && !goal3) {
    updateGoalSelection(true);
  }
  return false;
}
