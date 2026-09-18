import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendResetEmail(String email) async {
    await(ForgetPasswordLoading());
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      await(ForgetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      String msg = e.message ?? "Something went wrong";
      if (e.code == 'user-not-found') {
        msg = "No user found for that email";
      }
      if (e.code == 'invalid-email') {
        msg = "Invalid email address";
      }
      await(ForgetPasswordError(msg));
    } catch (e) {
      await(ForgetPasswordError(e.toString()));
    }
  }
}