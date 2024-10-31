import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qualifacts_case/router/app_router.gr.dart';
import 'package:qualifacts_case/services/characters_service/models/response/fetch_characters_response.dart';
import 'package:qualifacts_case/ui/app_image/app_image.dart';

class CharactersListItem extends StatelessWidget {
  final CharacterResult character;
  const CharactersListItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(CharacterPageRoute(character: character)),
      behavior: HitTestBehavior.opaque,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 160,
          width: 120,
          child: Hero(
            tag: character.id!,
            child: AppImage.network(
              asset: character.image ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
