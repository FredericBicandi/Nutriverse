import '../../Model/authentication_table/create_account.dart';
import '../../Model/authentication_table/get_user_by_email.dart';
import '../../includes.dart';
import 'user_info.dart';

// Initialise Screen Private Variables,Controllers
bool isSignInButtonPressed = false;
bool isGenderMalePressed = false;
bool isGenderFemalePressed = false;

TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController ageNumberController = TextEditingController();
TextEditingController weightNumberController = TextEditingController();
TextEditingController bmiNumberController = TextEditingController();
TextEditingController heightNumberController = TextEditingController();
String emailErrorText = "Invalid Email";

// Validation Variables
bool isValidFirstName = true;
bool isValidLastName = true;
bool isValidAge = true;
bool isValidWeight = true;
bool isValidHeight = true;

DateTime? selectedDate;

bool isSelectedMale = true, isSelectedFemale = false;
bool notSelected = false, goal1 = false, goal2 = false, goal3 = false;

// User Info Methods
void updateUserInfo(String key, String? value) => userInfo[key] = value;

bool checkUserInfo(List<String> keys) {
  for (var key in keys) {
    printDebugMsg("$key : ${userInfo[key] ?? 'null'}");
    if (userInfo[key] == null) {
      return false;
    }
  }
  return true;
}

bool createAccountValidation(
  bool selectGoal1,
  bool selectGoal2,
  bool selectGoal3,
) {
  if (checkUserInfo([
        "Firstname",
        "Lastname",
        "DOB",
        "Weight",
        "Height",
        "BMI",
        "Goal"
      ])) {
    printDebugMsg("all user info found");
    return true;
  }
  printDebugMsg("user info missing");
  return false;
}

// Calculation Methods
int calculateAge(DateTime birthDate) {
  DateTime today = DateTime.now();
  int age = today.year - birthDate.year;

  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }
  return age;
}

String calculateBMI(
    {required int age, required double heightCm, required double weightKg}) {
  if (heightCm <= 0 || weightKg <= 0 || age < 0) {
    return "Invalid input";
  }

  double heightInMeters = heightCm / 100; // Convert cm to meters
  double bmi = weightKg / (heightInMeters * heightInMeters); // BMI Formula

  // Determine BMI Category
  String category;
  if (bmi < 18.5) {
    category = "Underweight";
  } else if (bmi >= 18.5 && bmi < 24.9) {
    category = "Normal weight";
  } else if (bmi >= 25 && bmi < 29.9) {
    category = "Overweight";
  } else {
    category = "Obesity";
  }
  updateUserInfo("BMI", bmi.toStringAsFixed(1));
  return "BMI: ${bmi.toStringAsFixed(1)} ($category)";
}

// In your StatefulWidget file
void checkAccountInfo(
  BuildContext context,
  Function(bool) setLoading,
  Function(bool) setFirstNameValid,
  Function(bool) setLastNameValid,
  Function(bool) setAgeValid,
  Function(bool) setWeightValid,
  Function(bool) setHeightValid,
  Function(bool) setNotSelected,
) async {
  dismissKeyboard(context);
  if (isLoading) return;
  createAccountHandler(
    context,
    setLoading,
    setFirstNameValid,
    setLastNameValid,
    setAgeValid,
    setWeightValid,
    setHeightValid,
    setNotSelected,
  );
}
