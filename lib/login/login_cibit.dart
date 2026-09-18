import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading());
    try {
      await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginError(e.message ?? "Login failed"));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(LoginGoogleLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();
      if (googleUser == null) {
        emit(LoginInitial());
        return;
      }
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError('Google Sign In Failed: $e'));
    }
  }
}