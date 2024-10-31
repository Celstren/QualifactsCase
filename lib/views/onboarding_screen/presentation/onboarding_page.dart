import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';
import 'package:qualifacts_case/views/onboarding_screen/presentation/content/onboarding_content.dart';

@RoutePage(name: 'OnboardingPageRoute')
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsConstant.black,
      resizeToAvoidBottomInset: false,
      body: OnboardingContent(),
    );
  }
}
