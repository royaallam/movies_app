import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/login/login_scanner.dart';
import 'package:movies_app/register/resgister_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movies_app/onboarding/onboarding_screen.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/movie_details_screen.dart';
import 'package:movies_app/search_screen.dart';
import 'package:movies_app/search_results_screen.dart';
import 'package:movies_app/up_date_profile/up_date_profile_screen.dart';
import 'package:movies_app/up_date_profile/fordot_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardingCompleted = prefs.getBool("onboarding_completed") ?? false;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GoogleSignIn.instance.initialize(
    serverClientId: '791043766824-cf7ft76lajj70cgri7fng4tba6ip9v8c.apps.googleusercontent.com',
  );

  runApp(MovieApp(onboardingCompleted: onboardingCompleted));
}

class MovieApp extends StatelessWidget {
  final bool onboardingCompleted;
  const MovieApp({super.key, required this.onboardingCompleted});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF181818),
      ),
      initialRoute: onboardingCompleted ? LoginScaner.routeName : OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) =>  OnboardingScreen(),
        LoginScaner.routeName: (context) => const LoginScaner(),
        RegisterScaner.routeName: (context) => const RegisterScaner(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        MovieDetailsScreen.routeName: (context) => const MovieDetailsScreen(),
        SearchScreen.routeName: (context) => const SearchScreen(),
        SearchResultsScreen.routeName: (context) => const SearchResultsScreen(),
        UpDateProfileScreen.routeName: (context) => const UpDateProfileScreen(),
        ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
      },
    );
  }
}