import '../../includes.dart';
import 'package:http/http.dart' as http;

Future<int> findUser(String email) async {
  try {
    final response = await http.post(
      Uri.parse(
        'https://xidmzwoldcsmkxbkzibz.supabase.co/functions/v1/check-user-ts',
      ),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serviceRoleKey',
      },
      body: jsonEncode({'email': email}),
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
    printDebugMsg("Unknown error while searching for user change err =>$e");
    return 500;
  }
}
