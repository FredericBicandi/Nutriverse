import 'package:http/http.dart' as http;
import '../../includes.dart';

class SendEmail {
  Future<void> otp(String email, String code) async {
    final url = Uri.parse(
      'https://xidmzwoldcsmkxbkzibz.supabase.co/functions/v1/send-otp-email',
    );

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $dataBaseKey',
      },
      body: jsonEncode({
        'email': email,
        'code': code,
      }),
    );

    if (response.statusCode == 200) {
      printDebugMsg('OTP sent!');
    } else {
      printDebugMsg('Failed to send OTP: ${response.body}');
    }
  }
}
