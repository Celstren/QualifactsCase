import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qualifacts_case/views/home_screen/logic_holders/bloc/fetch_characters_bloc/fetch_characters_bloc.dart';
import 'package:qualifacts_case/views/home_screen/logic_holders/cubit/filter_characters_cubit/filter_characters_cubit.dart';
import 'package:qualifacts_case/views/home_screen/presentation/content/characters_list/character_list_empty.dart';
import 'package:qualifacts_case/views/home_screen/presentation/content/characters_list/character_list_loading.dart';
import 'package:qualifacts_case/views/home_screen/presentation/content/characters_list/characters_list_item.dart';

class CharactersList extends StatelessWidget {
  final FilterCharactersCubit filterCharactersCubit;
  final FetchCharactersBloc fetchCharactersBloc;
  final ScrollController scrollController;
  const CharactersList({
    super.key,
    required this.filterCharactersCubit,
    required this.fetchCharactersBloc,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: fetchCharactersBloc,
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
              if (direction == ScrollDirection.forward) return true;
              if (notification.metrics.maxScrollExtent ==
                  notification.metrics.pixels) {
                filterCharactersCubit.change(page: filterCharactersCubit.state.page + 1);
              }
              return true;
            },
            child: SingleChildScrollView(
              controller: scrollController,
              child: Wrap(
                runSpacing: 10,
                alignment: WrapAlignment.spaceBetween,
                children: fetchCharactersBloc.characters
                    .map((c) => CharactersListItem(character: c))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
