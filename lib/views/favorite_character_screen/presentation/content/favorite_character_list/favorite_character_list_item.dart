import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qualifacts_case/extension/favorite_character_data_extension.dart';
import 'package:qualifacts_case/router/app_router.gr.dart';
import 'package:qualifacts_case/services/storage_service/database.dart';
import 'package:qualifacts_case/ui/app_image/app_image.dart';
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
          height: 160,
          width: 120,
          child: Hero(
            tag: 'favorite_${favoriteCharacter.id}',
            child: AppImage.network(
              asset: favoriteCharacter.characterImage ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
