import 'includes.dart';

/*
*  PUBLIC Variables
*   @this file contain sensitive information and authentication keys avoid pushing it to the public
* */

late String? errorMessage="Unknown Error";
bool isLoading = false;
bool showPassword = true;
bool isValidEmail = true;
bool isValidPassword = true;
bool emailVerification = false;
bool isValidPasswordMatch = true;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

// User Data
File? imageFile;
String oldEmail = '';
String? imageUrl;
Map<String, dynamic> userInfo = {};

Session? session;
User? user;
final supabase = Supabase.instance.client;
final String dataBaseUrl = "https://xidmzwoldcsmkxbkzibz.supabase.co";
final String dataBaseKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhpZG16d29sZGNzbWt4Ymt6aWJ6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc0MjM4MjQsImV4cCI6MjA2Mjk5OTgyNH0.OAK5RH4aIPq3I-ZjaXhgHAlRMGm-OWubDnsUkLe6jr4";
final String serviceRoleKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhpZG16d29sZGNzbWt4Ymt6aWJ6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0NzQyMzgyNCwiZXhwIjoyMDYyOTk5ODI0fQ.2pTqReqXmj8-8YhFP5yiUysEoDpvCrCLPEa5QSvYh_k";
