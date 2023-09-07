import 'package:demo/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: 'Enter email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          TextButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade800,
                minimumSize: const Size(100, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: () async {
                // Call the loginWithoutPassword method and await its result
                auth.loginWithoutPassword(email.text);

      
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              )

              // Update the UI with the response

              )
        ],
      ),
    );
  }
}
