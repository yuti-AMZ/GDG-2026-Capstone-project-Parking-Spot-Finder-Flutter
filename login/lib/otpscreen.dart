import 'package:flutter/material.dart';
import 'reset_pass.dart';
import 'service/auth_service.dart';
class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();
  bool isLoading = false;

  final authService = AuthService();


void verifyOtp() async {
  if (otpController.text.length < 4) return;

  setState(() => isLoading = true);

  final response = await authService.verifyOtp(
    widget.email,
    otpController.text,
  );

  setState(() => isLoading = false);

  if (!response.containsKey("error")) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResetPasswordScreen(email: widget.email),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response["error"] ?? "Invalid OTP")),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),

            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ResetPasswordScreen(email:widget.email))),
                ),
                const Text(
                  "Verify Code",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),

            const SizedBox(height: 40),

            const Icon(Icons.verified_user, size: 80, color: Colors.orange),

            const SizedBox(height: 20),

            const Text(
              "Enter Verification Code",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              "We sent a code to ${widget.email}",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "------",
                filled: true,
                fillColor: Colors.grey[200],
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: isLoading ? null : verifyOtp,
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Verify",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                // resend OTP logic
              },
              child: const Text("Resend Code"),
            )
          ],
        ),
      ),
    );
  }
}