import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';
import 'package:qualifacts_case/views/home_screen/presentation/content/home_content.dart';

@RoutePage(name: 'HomePageRoute')
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsConstant.black,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: HomeContent(),
      ),
    );
  }
}
