import '../../includes.dart';

Future<String?> findBucketMedia(
  final String fileName,
  final String bucketName,
) async {
  try {
    String imagePath;

    imagePath = supabase.storage.from(bucketName).getPublicUrl(fileName);
    printDebugMsg("Image Found =>$imagePath");
    return imagePath;
  } catch (e) {
    printDebugMsg("Storage upload error: $e");
    return null;
  }
}
