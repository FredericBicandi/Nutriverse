import '../../includes.dart';

Future<int?> uploadBucketMedia(
  final String email,
  final String bucketName,
  final dynamic imageFile,
) async {
  try {
    final fileExt = imageFile.path.split('.').last;
    final fileName = "$email.$fileExt";

    await supabase.storage.from(bucketName).upload(fileName, imageFile);
    printDebugMsg("Image Profile Uploaded Successfully");
    return 200;
  } catch (e) {
    errorMessage = "Failed while uploading media";
    printDebugMsg("$errorMessage => $e");
    return 500;
  }
}
