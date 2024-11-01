import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qualifacts_case/extension/favorite_character_data_extension.dart';
import 'package:qualifacts_case/router/app_router.gr.dart';
import 'package:qualifacts_case/services/storage_service/database.dart';
import 'package:qualifacts_case/ui/app_image/app_image.dart';
import 'package:qualifacts_case/ui/app_text/app_text.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';
import 'package:qualifacts_case/views/favorite_character_screen/logic_holders/bloc/fetch_favorite_characters_bloc/fetch_favorite_characters_bloc.dart';

class FavoriteCharacterListItem extends StatelessWidget {
  final FavoriteCharacterData favoriteCharacter;
  final FetchFavoriteCharactersBloc fetchFavoriteCharactersBloc;
  const FavoriteCharacterListItem({super.key, required this.favoriteCharacter, required this.fetchFavoriteCharactersBloc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await AutoRouter.of(context).push(CharacterPageRoute(character: favoriteCharacter.toCharacter));
        fetchFavoriteCharactersBloc.add(const FetchFavoriteCharacters());
      },
      behavior: HitTestBehavior.opaque,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 140,
          width: 110,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Hero(
                  tag: 'favorite_${favoriteCharacter.id}',
                  child: AppImage.network(
                    asset: favoriteCharacter.characterImage ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56),
                    color: ColorsConstant.black.withOpacity(.6),
                  ),
                  child: AppText.medium(
                    favoriteCharacter.characterName ?? '',
                    fontSize: 10,
                    fontColor: ColorsConstant.white,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
