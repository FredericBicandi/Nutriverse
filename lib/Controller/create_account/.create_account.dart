import '../../Model/authentication_table/create_account.dart';
import '../../Model/authentication_table/get_user_by_email.dart';
import '../../includes.dart';
import 'user_info.dart';

String emailErrorText = "Invalid Email";

DateTime? selectedDate;


bool isValidAge = true;
bool isValidFirstName = true;
bool isValidLastName = true;
bool isValidWeight = true;
bool isValidHeight = true;


bool isGenderMalePressed = false;
bool isSignInButtonPressed = false;
bool isGenderFemalePressed = false;

bool isSelectedMale = true;
bool isSelectedFemale = false;

bool goal1 = false;
bool goal2 = false;
bool goal3 = false;
bool notSelected = false;

TextEditingController dateController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController bmiNumberController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController ageNumberController = TextEditingController();
TextEditingController weightNumberController = TextEditingController();
TextEditingController heightNumberController = TextEditingController();


void updateUserInfo(String key, String? value) => userInfo[key] = value;

bool checkUserInfo(List<String> keys) {
  for (var key in keys) {
    printDebugMsg("$key : ${userInfo[key] ?? 'null'}");
    if (userInfo[key] == null) return false;
  }
  return true;
}

bool createAccountValidation(bool selectGoal1, bool selectGoal2, bool selectGoal3) {
  if (checkUserInfo(["Firstname", "Lastname", "DOB", "Weight", "Height", "BMI", "Goal"]))
    return true;
  return false;
}

int calculateAge(DateTime birthDate) {

  DateTime today = DateTime.now();
  int age = today.year - birthDate.year;

  if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day))
    age--;
  return age;
}

String calculateBMI({required int age, required double heightCm, required double weightKg}) {

  if (heightCm <= 0 || weightKg <= 0 || age < 0) return "Invalid input";

  String category;
  double heightInMeters = heightCm / 100;
  double bmi = weightKg / (heightInMeters * heightInMeters);

  if (bmi < 18.5) category = "Underweight";
  else if (bmi >= 18.5 && bmi < 24.9) category = "Normal weight";
  else if (bmi >= 25 && bmi < 29.9) category = "Overweight";
  else category = "Obesity";

  updateUserInfo("BMI", bmi.toStringAsFixed(1));
  return "BMI: ${bmi.toStringAsFixed(1)} ($category)";
}

void checkAccountInfo(BuildContext context,
    Function(bool) setLoading,
    Function(bool) setFirstNameValid,
    Function(bool) setLastNameValid,
    Function(bool) setAgeValid,
    Function(bool) setWeightValid,
    Function(bool) setHeightValid,
    Function(bool) setNotSelected,) async {

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
