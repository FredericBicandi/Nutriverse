import '../../includes.dart';

Future<int?> deleteBucketMedia(
  final String fileName,
  final String bucketName,
) async {
  try {
    await supabase.storage.from(bucketName).remove([fileName]);
    printDebugMsg('Deleted successfully');
    return 200;
  } catch (e) {
    errorMessage = "Failed to delete media";
    printDebugMsg("Failed to delete media => $e");
    return 500;
  }
}
