import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/resgister_scanner.dart';
import 'package:movies_app/screens/home_screen.dart';

import 'package:movies_app/up_date_profile/forgot_password_screen.dart';


class LoginScaner extends StatefulWidget {
  static const String routeName = '/login';


  @override
  State<LoginScaner> createState() => _LoginScanerState();
}

class _LoginScanerState extends State<LoginScaner> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  Future<void> loginUser() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login successful")));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      String message = "Something went wrong";

      if (e.code == 'user-not-found') {
        message = "No account found with this email";
      } else if (e.code == 'wrong-password') {
        message = "Wrong password";
      } else if (e.code == 'invalid-credential') {
        message = "Email or password is incorrect";
      } else if (e.code == 'invalid-email') {
        message = "Invalid email address";
      } else if (e.code == 'user-disabled') {
        message = "This account has been disabled";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));

      print("Firebase Error: ${e.code}");
      print("Firebase Message: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _isLeftSelected = true;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Column(
          children: [
            SizedBox(height: 100),
            Image.asset("assets/images/logo.png", height: 118, width: 120),
            SizedBox(height: 50),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff282A28),
                      hintText: "Email ",
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        //borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Color(0xff282A28),
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your email";
                      }

                      if (!value.contains('@')) {
                        return "Please enter a valid email";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff282A28),
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }

                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.bottomRight,
              child:
               InkWell(
                                  onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) => ForgetPasswordScreen(),
                      ),
                    );
                                    },
                child: Text(
                  "Forget Password ?",
                  style: TextStyle(color: Color(0xffF6BD00)),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 56,
              width: 392,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF6BD00),
                  side: BorderSide(),
                ),
                onPressed: () {
                  loginUser();
                },
                child: Text("Login", style: TextStyle(color: Colors.black)),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don`t Have Account ?  ",
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) => RegisterScaner(),
                      ),
                    );
                                    },
                  child: Text(
                    " Create One",
                    style: TextStyle(color: Color(0xffF6BD00)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "-------- OR --------",
              style: TextStyle(color: Color(0xffF6BD00)),
            ),

            SizedBox(height: 16),
            Container(
              height: 56,
              width: 392,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF6BD00),
                ),
                child: Text(
                  "Login With Google ",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isLeftSelected = !_isLeftSelected;
                });
              },
              child: Container(
                width: 180,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFFD4AF37),
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: const Color(0xFF8B7355), width: 4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCircleFlag('assets/images/usa.png'),
                          _buildCircleFlag("assets/images/egpyt.jpeg"),
                        ],
                      ),

                      Align(
                        alignment: _isLeftSelected
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF8B7355),
                              width: 5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  Widget _buildCircleFlag(String assetPath) {
    return Container(
      width: 58,
      height: 58,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.flag),
      ),
    );
  }