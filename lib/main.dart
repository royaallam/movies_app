import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_scanner.dart';
import 'resgister_scanner.dart';

import 'onboarding/onboarding_screen.dart';

import 'home_screen.dart';
import 'movie_details_screen.dart';
import 'search_screen.dart';
import 'search_results_screen.dart';

import 'up_date_profile/up_date_profile_screen.dart';
import 'up_date_profile/fordot_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs =
  await SharedPreferences.getInstance();

  bool onboardingCompleted =
      prefs.getBool("onboarding_completed") ?? false;

  runApp(
    MovieApp(
      onboardingCompleted: onboardingCompleted,
    ),
  );
}

class MovieApp extends StatelessWidget {
  final bool onboardingCompleted;

  const MovieApp({
    super.key,
    required this.onboardingCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: onboardingCompleted
          ? LoginScaner.routeName
          : OnboardingScreen.routeName,

      routes: {
        // Onboarding
        OnboardingScreen.routeName: (context) =>
            OnboardingScreen(),

        // Authentication
        LoginScaner.routeName: (context) =>
            LoginScaner(),

        RegisterScaner.routeName: (context) =>
            RegisterScaner(),

        // Main App
        HomeScreen.routeName: (context) =>
            HomeScreen(),

        MovieDetailsScreen.routeName: (context) =>
            MovieDetailsScreen(),

        SearchScreen.routeName: (context) =>
            SearchScreen(),

        SearchResultsScreen.routeName: (context) =>
            SearchResultsScreen(),

        // Profile
        UpDateProfileScreen.routeName: (context) =>
            UpDateProfileScreen(),

        ForgetPasswordScreen.routeName: (context) =>
            ForgetPasswordScreen(),
      },
    );
  }
}