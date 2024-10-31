import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';
import 'package:qualifacts_case/views/favorite_character_screen/presentation/content/favorite_character_content.dart';

@RoutePage(name: 'FavoriteCharacterPageRoute')
class FavoriteCharacterPage extends StatelessWidget {
  const FavoriteCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsConstant.black,
      resizeToAvoidBottomInset: false,
      body: FavoriteCharacterContent(),
    );
  }
}
