import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_scanner.dart';
import 'onboarding_content.dart';
import 'onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (currentPage == pages_data.length - 1) {
      _completeOnboarding();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _completeOnboarding() async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();

    await prefs.setBool(
      "onboarding_completed",
      true,
    );

    Navigator.pushReplacementNamed(
      context,
      LoginScaner.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemCount: pages_data.length,
        itemBuilder: (context, index) {
          return OnboardingContent(
            image: pages_data[index]["image"]!,
            title: pages_data[index]["title"]!,
            desc: pages_data[index]["desc"] ?? "",
            isFirst: index == 0,
            isLast: index == pages_data.length - 1,
            onNext: _nextPage,
            onBack: _previousPage,
          );
        },
      ),
    );
  }
}