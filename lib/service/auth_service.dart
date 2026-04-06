import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl =
      "https://gdg-2026-capstone-project-parking-spot.onrender.com/api/v1/auth";

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http
          .post(
            Uri.parse("$baseUrl/login"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "email": email,
              "password": password,
            }),
          )
          .timeout(const Duration(seconds: 15));

      try {
        return jsonDecode(response.body);
      } catch (_) {
        return {"success": false, "error": "Invalid response from server"};
      }
    } catch (_) {
      return {
        "success": false,
        "error":
            "Unable to connect to server. Check backend/CORS and try again."
      };
    }
  }

  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/verify-otp"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "otp": otp,
        }),
      );
      return jsonDecode(response.body);
    } catch (_) {
      return {"success": false, "error": "Unable to verify OTP"};
    }
  }

  Future<Map<String, dynamic>> sendOtp(String email) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/forgot-password"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
        }),
      );

      return jsonDecode(response.body);
    } catch (_) {
      return {"success": false, "error": "Unable to send reset code"};
    }
  }

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    try {
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
    } catch (_) {
      return {"success": false, "error": "Unable to register right now"};
    }
  }
}