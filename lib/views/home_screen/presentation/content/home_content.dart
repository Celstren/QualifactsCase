import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qualifacts_case/injection.dart';
import 'package:qualifacts_case/services/characters_service/models/request/fetch_characters_request.dart';
import 'package:qualifacts_case/views/home_screen/logic_holders/bloc/fetch_characters_bloc/fetch_characters_bloc.dart';
import 'package:qualifacts_case/views/home_screen/logic_holders/cubit/filter_characters_cubit/filter_characters_cubit.dart';
import 'package:qualifacts_case/views/home_screen/presentation/content/characters_list/characters_list.dart';
import 'package:qualifacts_case/views/home_screen/presentation/content/search_character/search_character.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final fetchCharactersBloc = getIt<FetchCharactersBloc>();
  final filterCharactersCubit = getIt<FilterCharactersCubit>();
  final scrollController = ScrollController();

  @override
  void initState() {
    fetchCharactersBloc.add(FetchCharacters(request: filterCharactersCubit.state));
    super.initState();
  }

  @override
  void dispose() {
    fetchCharactersBloc.close();
    filterCharactersCubit.close();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener(
        bloc: filterCharactersCubit,
        listener: (context, FetchCharactersRequest state) {
          fetchCharactersBloc.add(FetchCharacters(request: state));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SearchCharacter(filterCharactersCubit: filterCharactersCubit),
              Expanded(
                child: CharactersList(
                  scrollController: scrollController,
                  filterCharactersCubit: filterCharactersCubit,
                  fetchCharactersBloc: fetchCharactersBloc,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
