import 'package:http/http.dart' as http;
import 'package:nutritracker/Model/authentication_table/get_user_by_email.dart';
import '../../includes.dart';

Future<int?> updateUserEmail(String oldEmail, String newEmail) async {
  try {
    if (await findUser(newEmail) == 200) {
      printDebugMsg('error email already found$errorMessage');
      return 400;
    }

    await http.post(
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
    await supabase
        .from('users')
        .update({'email': newEmail}).eq('email', oldEmail);

    return 200;
  } catch (e) {
    printDebugMsg("Email update error => $e");
    return 500;
  }
}

Future<int?> updateInfo(final String field, final String? value) async {
  try {
    String? email = user?.email;

    final response = await supabase
        .from('users')
        .update({field: value})
        .eq('email', email!)
        .select();
    printDebugMsg("user Data =>$response after UPDATE");
    return 200;
  } catch (e) {
    errorMessage = "Error while creating user account";
    printDebugMsg("$errorMessage => $e");
    return 500;
  }
}
