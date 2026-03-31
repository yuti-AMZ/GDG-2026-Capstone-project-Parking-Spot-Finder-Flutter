import '../model/authresponse.dart';
import '../model/otpresponse.dart';

class AuthService {
  Future<AuthResponse> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));

    return AuthResponse(
      success: true,
      token: "mock_token_123",
    );
  }

  Future<AuthResponse> sendOtp(String email) async {
    await Future.delayed(Duration(seconds: 1));

    return AuthResponse(success: true);
  }

  Future<OtpResponse> verifyOtp(String otp) async {
    await Future.delayed(Duration(seconds: 1));

    return OtpResponse(
      success: true,
      resetToken: "mock_reset_token",
    );
  }

  Future<AuthResponse> resetPassword(
      String password, String token) async {
    await Future.delayed(Duration(seconds: 1));

    return AuthResponse(success: true);
  }
}