import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/login/login_scanner.dart';
import 'package:movies_app/register/%20register_state.dart' show RegisterState, RegisterSuccess, RegisterError, RegisterLoading;

import 'register_cubit.dart';


class RegisterScaner extends StatefulWidget {
  static const String routeName = '/kkk';
  const RegisterScaner({super.key});

  @override
  State<RegisterScaner> createState() => _RegisterScanerState();
}

class _RegisterScanerState extends State<RegisterScaner> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emilController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rpasswordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool _isLeftSelected = true;

  @override
  void dispose() {
    nameController.dispose();
    emilController.dispose();
    passwordController.dispose();
    rpasswordController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Account created successfully")),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScaner()),
              );
            }
            if (state is RegisterError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            bool isLoading = state is RegisterLoading;
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 161,
                        width: 394,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/1781d833130f2d6e86fdf74b18fe8f84e378b3a2.png", width: 94, height: 94),
                            Image.asset("assets/images/0ecb0264ed6bae405d7a1f06d2b702842000ca23.png", width: 158, height: 161),
                            Image.asset("assets/images/22b644fc9582b0f4009d71c4fba3af8de2d76fa5.png", width: 94, height: 94),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: nameController,
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xff282A28),
                                hintText: "Name ",
                                prefixIcon: const Icon(Icons.badge, color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(color: Color(0xff282A28), width: 2),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) return "Please enter your name";
                                if (value.trim().length < 3) return "Name must be at least 3 characters";
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: emilController,
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xff282A28),
                                hintText: "Email ",
                                prefixIcon: const Icon(Icons.email, color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
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
                              style: const TextStyle(color: Colors.white),
                              controller: passwordController,
                              cursorColor: Colors.white,
                              obscureText: !isPasswordVisible,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xff282A28),
                                hintText: "Password ",
                                suffixIcon: IconButton(
                                  icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.white),
                                  onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                                ),
                                prefixIcon: const Icon(Icons.lock, color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) return "Please enter your password";
                                if (value.length < 6) return "Password must be at least 6 characters";
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: rpasswordController,
                              cursorColor: Colors.white,
                              obscureText: !isPasswordVisible,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xff282A28),
                                hintText: "Confirm Password ",
                                suffixIcon: IconButton(
                                  icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.white),
                                  onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                                ),
                                prefixIcon: const Icon(Icons.lock, color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) return "Please confirm your password";
                                if (value != passwordController.text) return "Passwords do not match";
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: mobileController,
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xff282A28),
                                hintText: "Phone Number",
                                prefixIcon: const Icon(Icons.call, color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 56,
                        width: 392,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : () {
                            if (formKey.currentState!.validate()) {
                              context.read<RegisterCubit>().registerUser(emilController.text, passwordController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffF6BD00)),
                          child: isLoading
                              ? const CircularProgressIndicator(color: Colors.black)
                              : const Text("Create Account", style: TextStyle(color: Colors.black)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already Have Account ", style: TextStyle(color: Colors.white)),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScaner()));
                            },
                            child: const Text("Login", style: TextStyle(color: Color(0xffF6BD00))),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => setState(() => _isLeftSelected = !_isLeftSelected),
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
              ),
            );
          },
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