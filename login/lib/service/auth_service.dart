import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "http://localhost:5000/api/v1/auth";

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    try{
    return jsonDecode(response.body);
    }catch(e){
      print("Login response is not JSON: ${response.body}");
      return {"success": false, "error": "Invalid response from server"};
    }
  }
 Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
  final response = await http.post(
    Uri.parse("$baseUrl/verify-otp"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "email": email,
      "otp": otp,
    }),
  );

  return jsonDecode(response.body);
}
Future<Map<String, dynamic>> sendOtp(String email) async {
  final response = await http.post(
    Uri.parse("$baseUrl/forgot-password"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "email": email,
    }),
  );

  return jsonDecode(response.body);
}

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "fullName": name,
        "email": email,
        "password": password,
        "role": "user"
      }),
    );

    return jsonDecode(response.body);
  }
}