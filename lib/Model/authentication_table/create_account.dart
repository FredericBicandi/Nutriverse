import '../../Model/Storage/upload_media.dart';
import '../../Model/Storage/find_media.dart';
import '../../includes.dart';

Future<int?> createUserAccount(
  final File? imageFile,
  final String email,
  final String password,
) async {
  try {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        "display_name": "${userInfo["Firstname"]} ${userInfo["Lastname"]}",
      },
    );
    if (response.user == null) {
      return 400;
    }
    if (imageFile != null) {
      printDebugMsg("Uploading user photo!");

      try {
        int? res = await uploadBucketMedia(email, 'userphotos', imageFile);

        if (res == 200) {
          imageUrl = await findBucketMedia(
            "$email.${imageFile.path.split('.').last}",
            "userphotos",
          );
        }
      } catch (e) {
        printDebugMsg("error image processing => $e");
        return 500;
      }
    }

    await supabase.from('users').insert({
      "email": email,
      "photo": imageUrl == '' ? null : imageUrl,
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
    printDebugMsg("$e");
    return 500;
  }
}
