import '../../includes.dart';

Future<int?> saveUserInfo(final String email) async {
  try {
    await supabase.from('users').insert({
      "email": email,
      "photo": imageUrl,
      "height": userInfo["Height"],
      "weight": userInfo["Weight"],
      "bmi": userInfo["BMI"],
      "age": userInfo["Age"],
      "birthdate": userInfo["DOB"],
      "gender": userInfo["Gender"] == "Female" ? false : true,
      "goal": userInfo["Goal"],
    });
    return 200;
  } catch (e) {
    errorMessage = "Error while creating user account";
    printDebugMsg("$errorMessage => $e");
    return 500;
  }
}
