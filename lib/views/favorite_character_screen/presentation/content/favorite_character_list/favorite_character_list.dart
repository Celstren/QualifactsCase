import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qualifacts_case/views/favorite_character_screen/logic_holders/bloc/fetch_favorite_characters_bloc/fetch_favorite_characters_bloc.dart';
import 'package:qualifacts_case/views/favorite_character_screen/presentation/content/favorite_character_list/favorite_character_list_item.dart';
import 'package:qualifacts_case/views/home_screen/presentation/content/characters_list/character_list_empty.dart';
import 'package:qualifacts_case/views/home_screen/presentation/content/characters_list/character_list_loading.dart';

class FavoriteCharacterList extends StatelessWidget {
  final FetchFavoriteCharactersBloc fetchFavoriteCharactersBloc;
  const FavoriteCharacterList(
      {super.key, required this.fetchFavoriteCharactersBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: fetchFavoriteCharactersBloc,
      builder: (context, state) {
        if (state is FetchFavoriteCharactersLoadingState) {
          return const Center(child: CharacterListLoading());
        }
        if (state is FetchFavoriteCharactersErrorState) {
          return const CharacterListEmpty();
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Wrap(
              runSpacing: 10,
              alignment: WrapAlignment.spaceBetween,
              children: fetchFavoriteCharactersBloc.characters
                  .map((c) => FavoriteCharacterListItem(
                        favoriteCharacter: c,
                        fetchFavoriteCharactersBloc:
                            fetchFavoriteCharactersBloc,
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
