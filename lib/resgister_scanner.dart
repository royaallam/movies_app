
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/login_scanner.dart';

class RegisterScaner extends StatefulWidget {
  static const String routeName = '/kkk';
  @override
  State<RegisterScaner> createState() => _RegisterScanerState();
}

class _RegisterScanerState extends State<RegisterScaner> {
  Future<void> registerUser() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emilController.text.trim(),
            password: passwordController.text.trim(),
          );

      print("User created: ${userCredential.user?.uid}");

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScaner()),
      );
    } on FirebaseAuthException catch (e) {
      print("Firebase Error Code: ${e.code}");
      print("Firebase Error Message: ${e.message}");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Firebase Error: ${e.code}")));
    }
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emilController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rpasswordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final formKey = GlobalKey<FormState>();
    bool isPasswordVisible = false;


  @override
  Widget build(BuildContext context) {
    bool _isLeftSelected = true;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                height: 161,
                width: 394,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 94,
                      height: 94,
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      width: 158,
                      height: 161,
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      width: 94,
                      height: 94,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: nameController,
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff282A28),
                        hintText: "Name ",

                        prefixIcon: Icon(
                          Icons.badge,
                          color: Colors.white,
                        ),
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
                          return "Please enter your name";
                        }

                        if (value.trim().length < 3) {
                          return "Name must be at least 3 characters";
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 16),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: emilController,
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
                      style: TextStyle(color: Colors.white),
                      controller: passwordController,
                      cursorColor: Colors.white,
                      obscureText: isPasswordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff282A28),
                        hintText: "Password ",
                        suffixIcon: Icon(
                          isPasswordVisible
                          ?Icons.visibility:Icons.visibility,
                          color: Colors.white,
                        ),

                        prefixIcon: Icon(Icons.email, color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          // borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
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
                    SizedBox(height: 16),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: rpasswordController,
                      cursorColor: Colors.white,
                      obscureText: isPasswordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff282A28),
                        hintText: "Confim Password ",
                        suffixIcon: Icon(
                          isPasswordVisible
                          ?Icons.visibility:Icons.visibility,
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          // borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        }

                        if (value != passwordController.text) {
                          return "Passwords do not match";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: mobileController,
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff282A28),
                        hintText: "Phone Number",
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(Icons.call, color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          // borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 56,
                width: 392,
                child: ElevatedButton(
                  onPressed: registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF6BD00),
                  ),
                  child: Text(
                    "Create Account",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have Accont ",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => LoginScaner(),
                        ),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Color(0xffF6BD00)),
                    ),
                  ),
                ],
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
                    border: Border.all(
                      color: const Color(0xFF8B7355),
                      width: 4,
                    ),
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
      ),
    );
  }
}

Widget _buildCircleFlag(String assetPath) {
  return Container(
    width: 58,
    height: 58,
    decoration: const BoxDecoration(shape: BoxShape.circle),
    clipBehavior: Clip.antiAlias,
    child: Image.asset(
      assetPath,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.flag),
    ),
  );
}