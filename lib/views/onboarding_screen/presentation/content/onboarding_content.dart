import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qualifacts_case/router/app_router.gr.dart';
import 'package:qualifacts_case/ui/app_button/app_button.dart';
import 'package:qualifacts_case/ui/app_text/app_animated_text.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({super.key});

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 24),
            const AppAnimatedText.medium(
              'Hola Soy Rick Sánchez\nGustavo me pidió hacer una app de los personajes de mi serie\nAsí que empecemos',
              fontColor: ColorsConstant.moonstone,
              fontSize: 16,
            ),
            const SizedBox(height: 24),
            Center(
              child: Lottie.asset(
                'assets/animations/Rick_Animation.json',
                controller: _controller,
                fit: BoxFit.cover,
                onLoaded: (composition) {
                  _controller
                    ..duration = const Duration(seconds: 3)
                    ..repeat();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 24),
              child: AppButton(
                key: const ValueKey('onboarding_button_key'),
                text: 'CLICK AQUÍ',
                onTap: () => AutoRouter.of(context).replace(const DashboardPageRoute()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
