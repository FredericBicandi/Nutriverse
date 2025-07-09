import '../../Model/Storage/upload_media.dart';
import '../../Model/Storage/find_media.dart';
import '../../includes.dart';

Future<int?> createUserAccount(final File? imageFile,
    final String email,
    final String password,) async {
  try {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        "display_name": "${userInfo["Firstname"]} ${userInfo["Lastname"]}",
      },
    );
    if (response.user == null) {
      errorMessage = "Error While Creating User!";
      return 400;
    }
    if (imageFile != null) {
      printDebugMsg("Uploading user photo!");
      try {
        await uploadBucketMedia(email, 'userphotos', imageFile);

        imageUrl = await findBucketMedia(
          "$email.${imageFile.path
              .split('.')
              .last}",
          "userphotos",
        );
        if (imageUrl == null) return 301;
      } catch (e) {
        errorMessage = "Error while uploading user photo!";
        printDebugMsg("$errorMessage => $e");
        return 301;
      }
    }

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
