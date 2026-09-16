import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movies_app/login_scanner.dart';
import 'package:movies_app/resgister_scanner.dart';
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
      initialRoute: onboardingCompleted ? '/login' : OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginScaner.routeName: (context) =>  LoginScaner(),
        RegisterScaner.routeName: (context) =>  RegisterScaner(),
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