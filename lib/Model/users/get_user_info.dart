import '../../includes.dart';

Future<Map<String, dynamic>?> getUserInfo(String? email) async {
  try {
    final value = email;
    if (value == null) return null;
    return await supabase
        .from('users')
        .select()
        .eq('email', value)
        .maybeSingle();
  } catch (e) {
    errorMessage = "Error while fetching user data";
    printDebugMsg("$errorMessage => $e");
    return null;
  }
}
