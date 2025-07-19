import '../../includes.dart';

Future<Map<String, dynamic>?> getUserInfo() async {
  try {
    return await supabase
        .from('users')
        .select()
        .eq('email', user?.email ?? '')
        .maybeSingle();
  } catch (e) {
    errorMessage = "Error while fetching user data";
    printDebugMsg("$errorMessage => $e");
    return null;
  }
}
