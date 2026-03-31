class OtpResponse {
  final bool success;
  final String? resetToken;

  OtpResponse({required this.success, this.resetToken});

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      success: json['success'] ?? false,
      resetToken: json['resetToken'],
    );
  }
}