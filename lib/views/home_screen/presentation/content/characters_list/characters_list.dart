import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qualifacts_case/ui/app_text/app_text.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';
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
                filterCharactersCubit.change(page: filterCharactersCubit.state.page + 1);
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
                    children: <Widget>[
                      ...fetchCharactersBloc.characters.map((c) {
                        final isFavorite =
                            favorites.indexWhere((f) => f.characterId == c.id) !=
                                -1;
                        return CharactersListItem(
                            character: c,
                            isFavorite: isFavorite,
                            fetchFavoriteCharactersBloc:
                            fetchFavoriteCharactersBloc);
                      }),
                      if (Platform.isWindows && !fetchCharactersBloc.paginationExceeded(filterCharactersCubit.state.page + 1))
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () => filterCharactersCubit.change(page: filterCharactersCubit.state.page + 1),
                              highlightColor: ColorsConstant.moonstone,
                              splashColor: ColorsConstant.moonstone,
                              child: SizedBox(
                                height: 140,
                                width: 110,
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 140,
                                        width: 110,
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            AppText.medium(
                                              'Cargar más',
                                              fontSize: 18,
                                              fontColor: ColorsConstant.black,
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 12),
                                            Icon(
                                              Icons.add_circle_outlined,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
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
