// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, use_key_in_widget_constructors, library_private_types_in_public_api, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_flutter_absen/app/controllers/auth_controller.dart';
import 'package:uas_flutter_absen/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final srt = Get.put(AuthController());
    final controller = Get.put(LoginController());
    return Scaffold(
        backgroundColor: Color(0xFF1C1C1C),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                Text(
                  'Silk Road',
                  style: TextStyle(
                    color: Color(0xFFFFA500),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Hello Again!\nWelcome Back You\'ve been missed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: controller.email,
                  decoration: InputDecoration(
                    
                    filled: true,
                    fillColor: Colors.grey[800],
                    hintText: 'Your Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: controller.password,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[800],
                    hintText: 'Your Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  onSubmitted: (value) {() => srt.login(controller.email.text, controller.password.text);},
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.FORGOTPASSWORD);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => srt.login(controller.email.text, controller.password.text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA500),
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'with',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.g_mobiledata, color: Colors.white),
                  label: Text('Login with Google',
                      style: TextStyle(color: Colors.white)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFFFFA500)),
                    padding: EdgeInsets.symmetric(
                        vertical:
                            20.0), // Adjusted to match the height of the email box
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.facebook, color: Colors.white),
                  label: Text('Login with Facebook',
                      style: TextStyle(color: Colors.white)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFFFFA500)),
                    padding: EdgeInsets.symmetric(
                        vertical:
                            20.0), // Adjusted to match the height of the email box
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text(
                    'Don\'t have an Account? Sign Up',
                    style: TextStyle(color: Color(0xFFFFA500)),
                  ),
                ),
              ],
            )));
  }
}
