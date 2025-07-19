import '../../Model/verified_users/unverified_user.dart';
import '../../Model/storage/upload_media.dart';
import '../../Model/storage/find_media.dart';
import '../../Model/users/save_user_info.dart';
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
      errorMessage = "Error While Creating User!";
      return 400;
    }
    if (imageFile != null) {
      printDebugMsg("Uploading user photo!");
      try {
        await uploadBucketMedia(email, 'userphotos', imageFile);

        imageUrl = await findBucketMedia(
          "$email.${imageFile.path.split('.').last}",
          "userphotos",
        );
        if (imageUrl == null) return 301;
      } catch (e) {
        errorMessage = "Error while uploading user photo!";
        printDebugMsg("$errorMessage => $e");
        return 301;
      }
    }
    if (await saveUserInfo(email) == 500 ||
        await unverifiedUserCreate(email) == 500) {
      return 500;
    }
    return 200;
  } catch (e) {
    errorMessage = "Error while creating user account";
    printDebugMsg("$errorMessage => $e");
    return 500;
  }
}
