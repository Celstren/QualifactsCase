import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';
import 'package:qualifacts_case/views/splash_screen/presentation/content/splash_screen_content.dart';

@RoutePage(name: 'SplashScreenPageRoute')
class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsConstant.black,
      resizeToAvoidBottomInset: false,
      body: SplashScreenContent(),
    );
  }
}
