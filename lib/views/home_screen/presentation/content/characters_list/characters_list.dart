import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qualifacts_case/views/favorite_character_screen/logic_holders/bloc/fetch_favorite_characters_bloc/fetch_favorite_characters_bloc.dart';
import 'package:qualifacts_case/views/home_screen/logic_holders/bloc/fetch_characters_bloc/fetch_characters_bloc.dart';
import 'package:qualifacts_case/views/home_screen/logic_holders/cubit/filter_characters_cubit/filter_characters_cubit.dart';
import 'package:qualifacts_case/views/home_screen/presentation/content/characters_list/character_list_empty.dart';
import 'package:qualifacts_case/views/home_screen/presentation/content/characters_list/character_list_loading.dart';
import 'package:qualifacts_case/views/home_screen/presentation/content/characters_list/characters_list_item.dart';

class CharactersList extends StatelessWidget {
  final ScrollController scrollController;
  final FilterCharactersCubit filterCharactersCubit;
  final FetchCharactersBloc fetchCharactersBloc;
  final FetchFavoriteCharactersBloc fetchFavoriteCharactersBloc;
  const CharactersList({
    super.key,
    required this.scrollController,
    required this.filterCharactersCubit,
    required this.fetchCharactersBloc,
    required this.fetchFavoriteCharactersBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: fetchCharactersBloc,
      listener: (context, state) {
        if (state is FetchCharactersSuccessState) {
          fetchFavoriteCharactersBloc.add(const FetchFavoriteCharacters());
        }
      },
      builder: (context, state) {
        if (state is FetchCharactersLoadingState) {
          return const Center(child: CharacterListLoading());
        }
        if (state is FetchCharactersErrorState) {
          return const CharacterListEmpty();
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              var direction = scrollController.position.userScrollDirection;
              if (state is FetchNextCharactersLoadingState ||
                  state is FetchCharactersLoadingState) return false;
              if (direction == ScrollDirection.forward ||
                  direction == ScrollDirection.idle) return true;
              if (notification.metrics.maxScrollExtent ==
                  notification.metrics.pixels) {
                filterCharactersCubit.change(
                    page: filterCharactersCubit.state.page + 1);
              }
              return true;
            },
            child: SingleChildScrollView(
              controller: scrollController,
              child: BlocBuilder(
                bloc: fetchFavoriteCharactersBloc,
                builder: (context, state) {
                  final favorites = fetchFavoriteCharactersBloc.characters;
                  return Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    children: fetchCharactersBloc.characters.map((c) {
                      final isFavorite =
                          favorites.indexWhere((f) => f.characterId == c.id) !=
                              -1;
                      return CharactersListItem(
                          character: c,
                          isFavorite: isFavorite,
                          fetchFavoriteCharactersBloc:
                              fetchFavoriteCharactersBloc);
                    }).toList(),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
