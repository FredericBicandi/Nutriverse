import 'package:http/http.dart' as http;
import '../../includes.dart';

Future<int> updateUserPassword(String email, String newPassword) async {
  try {
    final response = await http.post(
      Uri.parse(
          'https://xidmzwoldcsmkxbkzibz.supabase.co/functions/v1/password_reset'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serviceRoleKey',
      },
      body: jsonEncode({'email': email, 'newPassword': newPassword}),
    );
    if (response.statusCode == 200) {
      printDebugMsg("user $email found => ${response.statusCode}");
      return 200;
    } else {
      printDebugMsg("user not found => ${response.statusCode}");
      if (response.statusCode == 401) return 500;
      return 404;
    }
  } catch (e) {
    errorMessage =
        "Unknown error while finding user to request password change";
    printDebugMsg(" $errorMessage=>$e");
    return 500;
  }
}
