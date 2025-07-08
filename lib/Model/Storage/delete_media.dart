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
    printDebugMsg("$e");
    return 500;
  }
}
