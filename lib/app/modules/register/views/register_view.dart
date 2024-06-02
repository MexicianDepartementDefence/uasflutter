import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_flutter_absen/app/routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Image.asset(
              'assets/logo.png', // Add your logo asset here
              height: 100,
            ),
            SizedBox(height: 20),
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
              'Hello,',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Please Create an Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Full Name',
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
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFA500),
                padding: EdgeInsets.symmetric(vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Sign In',
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
              label: Text('Sign Up with Google',
                  style: TextStyle(color: Colors.white)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFFFFA500)),
                padding: EdgeInsets.symmetric(vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.facebook, color: Colors.white),
              label: Text('Sign Up with Facebook',
                  style: TextStyle(color: Colors.white)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFFFFA500)),
                padding: EdgeInsets.symmetric(vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: Text(
                'Already have an Account? Login',
                style: TextStyle(color: Color(0xFFFFA500)),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
