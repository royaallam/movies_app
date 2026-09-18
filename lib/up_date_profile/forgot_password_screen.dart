import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/app_assets.dart';
import 'package:movies_app/core/app_icons.dart';
import 'package:movies_app/core/app_strings.dart';

import '../core/app_colors.dart';
import 'forget_password_cubit.dart';
import 'forget_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = "/ForgetPassword";
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgetPasswordCubit(),
      child: Scaffold(
        backgroundColor: AppColors.blackcolor,
        body: SafeArea(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Check your email, reset link sent!"),
                    backgroundColor: AppColors.orangecolor,
                  ),
                );
                Navigator.pop(context);
              }
              if (state is ForgetPasswordError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 34),
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Image.asset(AppIcons.arrowIcon),
                              ),
                            ),
                            const SizedBox(width: 60),
                            Text(
                              AppStrings.forgetPasswordString,
                              style: TextStyle(color: AppColors.orangecolor),
                            ),
                          ],
                        ),
                        Image.asset(
                          AppAssets.forgotPasswordImage,
                          width: 430,
                          height: 430,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                style: TextStyle(color: AppColors.whitecolor),
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return "Enter email";
                                  }
                                  if (!v.contains('@')) {
                                    return "Enter valid email";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  prefixIcon: Image.asset(AppIcons.vectorIcon),
                                  hintText: AppStrings.emailString,
                                  hintStyle:
                                      TextStyle(color: AppColors.whitecolor),
                                  fillColor: AppColors.graycolor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.orangecolor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<ForgetPasswordCubit>()
                                          .sendResetEmail(
                                              _emailController.text);
                                    }
                                  },
                                  child: state is ForgetPasswordLoading
                                      ? CircularProgressIndicator(
                                          color: AppColors.blackcolor)
                                      : Text(
                                         AppStrings.verifyEmailString,
                                          style: TextStyle(
                                            color: AppColors.blackcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}