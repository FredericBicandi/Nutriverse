import 'package:http/http.dart' as http;
import '../../includes.dart';

Future<int?> updateUserEmail(String oldEmail, String newEmail) async {
  try {
    final currentUser = supabase.auth.currentUser;
    if (currentUser == null || currentUser.email != oldEmail) {
      printDebugMsg("Not logged in as $oldEmail");
      return 403;
    }

    final response = await http.post(
      Uri.parse(
          'https://xidmzwoldcsmkxbkzibz.supabase.co/functions/v1/changeAuthEmail'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serviceRoleKey',
      },
      body: jsonEncode({
        'user_id': supabase.auth.currentUser?.id,
        'new_email': newEmail,
      }),
    );

    if (response.statusCode == 500) {
      errorMessage = "error while update user email";
      printDebugMsg('$errorMessage');
      return 500;
    }
    printDebugMsg("$response");

    await supabase
        .from('users')
        .update({'email': newEmail}).eq('email', oldEmail);

    return 200;
  } catch (e) {
    printDebugMsg("Email update error => $e");
    return 500;
  }
}
