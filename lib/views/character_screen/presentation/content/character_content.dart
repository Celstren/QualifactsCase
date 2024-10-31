import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qualifacts_case/injection.dart';
import 'package:qualifacts_case/services/characters_service/models/response/fetch_characters_response.dart';
import 'package:qualifacts_case/ui/app_image/app_image.dart';
import 'package:qualifacts_case/ui/app_text/app_text.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';
import 'package:qualifacts_case/views/character_screen/bloc/favorite_character_bloc/favorite_character_bloc.dart';
import 'package:qualifacts_case/views/character_screen/bloc/validate_favorite_character_bloc/validate_favorite_character_bloc.dart';

class CharacterContent extends StatefulWidget {
  final CharacterResult character;
  const CharacterContent({super.key, required this.character});

  @override
  State<CharacterContent> createState() => _CharacterContentState();
}

class _CharacterContentState extends State<CharacterContent> {
  final validateFavoriteCharacterBloc = getIt<ValidateFavoriteCharacterBloc>();
  final favoriteCharacterBloc = getIt<FavoriteCharacterBloc>();

  @override
  void initState() {
    final characterId = widget.character.id;
    if (characterId != null) {
      validateFavoriteCharacterBloc.add(ValidateFavoriteCharacter(characterId: characterId));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: BlocListener(
          bloc: favoriteCharacterBloc,
          listener: (context, state) {
            if (state is FavoriteCharacterSuccessState) {
              final characterId = widget.character.id;
              if (characterId == null) return;
              validateFavoriteCharacterBloc.add(ValidateFavoriteCharacter(characterId: characterId));
            }
          },
          child: BlocBuilder(
            bloc: validateFavoriteCharacterBloc,
            builder: (context, state) {
              final isFavorite = state is ValidateFavoriteCharacterSuccessState && state.isFavorite;
              return Center(
                child: isFavorite ?
                const Icon(Icons.favorite, color: Colors.red) :
                const Icon(Icons.favorite_border),
              );
            },
          ),
        ),
        onPressed: () => favoriteCharacterBloc.add(FavoriteCharacter(character: widget.character)),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 320,
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: widget.character.heroTag,
                  child: AppImage.network(
                    width: MediaQuery.of(context).size.width,
                    height: 320,
                    asset: widget.character.image ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: AutoRouter.of(context).maybePop,
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: ColorsConstant.black.withOpacity(.4),
                                  width: 3,
                                ),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.chevron_left,
                                  size: 24,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AppText.medium(
                  widget.character.name ?? '',
                  fontColor: ColorsConstant.mantis,
                  fontSize: 24,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 12),
                AppText.normal(
                  widget.character.status ?? '',
                  fontColor: ColorsConstant.mantis,
                  fontSize: 16,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 12),
                AppText.normal(
                  widget.character.species ?? '',
                  fontColor: ColorsConstant.mantis,
                  fontSize: 16,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
