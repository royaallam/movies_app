import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/login/login_cibit.dart';
import 'package:movies_app/login/login_state.dart';
import 'package:movies_app/register/resgister_scanner.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/up_date_profile/fordot_password_screen.dart';

import 'package:flutter_svg/flutter_svg.dart';


class LoginScaner extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScaner({super.key});

  @override
  State<LoginScaner> createState() => _LoginScanerState();
}

class _LoginScanerState extends State<LoginScaner> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool _isLeftSelected = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login successful")),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            }
            if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            bool isLoading = state is LoginLoading || state is LoginGoogleLoading;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Image.asset("assets/images/logo.png", height: 118, width: 120),
                    const SizedBox(height: 50),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: emailController,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xff282A28),
                              hintText: "Email ",
                              prefixIcon: const Icon(Icons.email, color: Colors.white),
                              hintStyle: const TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Color(0xff282A28), width: 2),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) return "Please enter your email";
                              if (!value.contains('@')) return "Please enter a valid email";
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
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
                                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) return "Please enter your password";
                              if (value.length < 6) return "Password must be at least 6 characters";
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()),
                          );
                        },
                        child: const Text("Forget Password ?", style: TextStyle(color: Color(0xffF6BD00))),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 56,
                      width: 392,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffF6BD00)),
                        onPressed: isLoading ? null : () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().loginUser(emailController.text, passwordController.text);
                          }
                        },
                        child: state is LoginLoading
                            ? const CircularProgressIndicator(color: Colors.black)
                            : const Text("Login", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don`t Have Account ?  ", style: TextStyle(color: Colors.white)),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScaner()));
                          },
                          child: const Text(" Create One", style: TextStyle(color: Color(0xffF6BD00))),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text("-------- OR --------", style: TextStyle(color: Color(0xffF6BD00))),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 56,
                      width: 392,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : () {
                          context.read<LoginCubit>().signInWithGoogle();
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffF6BD00)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (state is LoginGoogleLoading)
                              const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2),
                              )
                            else ...[
                              SvgPicture.asset("assets/icons/icon_google.svg", width: 24, height: 24, color: Colors.black),
                              const SizedBox(width: 10),
                              const Text("Login With Google", style: TextStyle(color: Colors.black)),
                            ]
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
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
                                alignment: _isLeftSelected ? Alignment.centerLeft : Alignment.centerRight,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: const Color(0xFF8B7355), width: 5),
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
          },
        ),
      ),
    );
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
}