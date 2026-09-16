import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movies_app/login_scanner.dart';
import 'package:movies_app/onboarding/onboarding_content.dart';
import 'package:movies_app/onboarding/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _controller;
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

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);
    if (mounted) {
      Navigator.pushReplacementNamed(context, LoginScaner.routeName);
    }
  }

  void _nextPage() {
    if (currentPage < pagesData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _previousPage() {
    if (currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (index) {
          if (mounted) {
            setState(() {
              currentPage = index;
            });
          }
        },
        itemCount: pagesData.length,
        itemBuilder: (context, index) {
          return OnboardingContent(
            image: pagesData[index]["image"]!,
            title: pagesData[index]["title"]!,
            desc: pagesData[index]["desc"] ?? "",
            isFirst: index == 0,
            isLast: index == pagesData.length - 1,
            currentPage: currentPage,
            onNext: _nextPage,
            onBack: _previousPage,
          );
        },
      ),
    );
  }
}