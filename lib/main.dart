import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardingCompleted = prefs.getBool("onboarding_completed") ?? false;

  runApp(MovieApp(onboardingCompleted: onboardingCompleted));
}

class MovieApp extends StatelessWidget {
  final bool onboardingCompleted;
  const MovieApp({required this.onboardingCompleted});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
      onboardingCompleted ? HomeScreen.routeName : OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}