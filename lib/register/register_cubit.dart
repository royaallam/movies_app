import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/register/%20register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser(String email, String password) async {
    emit(RegisterLoading());
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      String message = "Something went wrong";
      if (e.code == 'email-already-in-use') message = "This email is already in use";
      else if (e.code == 'invalid-email') message = "Invalid email address";
      else if (e.code == 'weak-password') message = "Password is too weak";
      else message = e.message ?? message;
      emit(RegisterError(message));
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}