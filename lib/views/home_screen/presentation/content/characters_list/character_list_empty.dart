import 'package:flutter/material.dart';
import 'package:qualifacts_case/ui/app_image/app_image.dart';
import 'package:qualifacts_case/ui/app_text/app_text.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';

class CharacterListEmpty extends StatelessWidget {
  const CharacterListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 240,
          width: 240,
          child: AppImage.assetImage(
            asset: 'assets/images/rick.png',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 24),
        AppText.medium(
          'No lo conozco, ¿es de algún nuevo universo o algo parecido?',
          fontSize: 24,
          fontColor: ColorsConstant.moonstone,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
