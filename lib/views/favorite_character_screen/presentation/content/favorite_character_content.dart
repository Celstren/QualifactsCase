import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qualifacts_case/injection.dart';
import 'package:qualifacts_case/views/favorite_character_screen/logic_holders/bloc/fetch_favorite_characters_bloc/fetch_favorite_characters_bloc.dart';
import 'package:qualifacts_case/views/favorite_character_screen/presentation/content/favorite_character_list/favorite_character_list.dart';

class FavoriteCharacterContent extends StatefulWidget {
  const FavoriteCharacterContent({super.key});

  @override
  State<FavoriteCharacterContent> createState() => _FavoriteCharacterContentState();
}

class _FavoriteCharacterContentState extends State<FavoriteCharacterContent> with AutoRouteAwareStateMixin {
  final fetchFavoriteCharactersBloc = getIt<FetchFavoriteCharactersBloc>();

  @override
  void initState() {
    fetchFavoriteCharactersBloc.add(const FetchFavoriteCharacters());
    super.initState();
  }

  @override
  void dispose() {
    fetchFavoriteCharactersBloc.close();
    super.dispose();
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    fetchFavoriteCharactersBloc.add(const FetchFavoriteCharacters());
    super.didChangeTabRoute(previousRoute);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FavoriteCharacterList(fetchFavoriteCharactersBloc: fetchFavoriteCharactersBloc),
      ),
    );
  }
}
