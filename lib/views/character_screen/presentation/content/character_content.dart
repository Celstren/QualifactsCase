import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qualifacts_case/injection.dart';
import 'package:qualifacts_case/services/characters_service/models/enum/characters_enum.dart';
import 'package:qualifacts_case/services/characters_service/models/response/fetch_characters_response.dart';
import 'package:qualifacts_case/ui/app_custom_paint/app_coach_bottom_right_indicator_painter.dart';
import 'package:qualifacts_case/ui/app_image/app_image.dart';
import 'package:qualifacts_case/ui/app_text/app_animated_text.dart';
import 'package:qualifacts_case/ui/app_text/app_text.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';
import 'package:qualifacts_case/views/character_screen/bloc/favorite_character_bloc/favorite_character_bloc.dart';
import 'package:qualifacts_case/views/character_screen/bloc/validate_favorite_character_bloc/validate_favorite_character_bloc.dart';
import 'package:qualifacts_case/views/character_screen/presentation/content/character_content_description.dart';

class CharacterContent extends StatefulWidget {
  final CharacterResult character;
  const CharacterContent({super.key, required this.character});

  @override
  State<CharacterContent> createState() => _CharacterContentState();
}

class _CharacterContentState extends State<CharacterContent> {
  var random = Random();
  final validateFavoriteCharacterBloc = getIt<ValidateFavoriteCharacterBloc>();
  final favoriteCharacterBloc = getIt<FavoriteCharacterBloc>();
  final customPhrases = <String, List<String>>{
    'male': <String>[
      'Este es {name} es un {specie} y la última vez que lo ví estaba {status}',
      'Aún me acuerdo de {name} el {specie} según mis registros está {status}',
    ],
    'female': <String>[
      'Esta es {name} es una {specie} y la última vez que la ví estaba {status}',
      'Aún recuerdo a {name} la {specie} según mis registros está {status}',
    ],
    'unknown': <String>[
      'Este es {name} es un {specie} y la última vez que lo ví estaba {status}',
      'Aún me acuerdo de {name} el {specie} según mis registros está {status}',
    ],
  };
  final fixedPhrases = <int, String>{
    1: 'La mente más grande de este y todos los universos. Rick Sanchez es un humano que sigue vivo viajando entre dimensiones junto a su preciado Morty.',
    2: 'Morty Smith el ayudante por excelencia de cada Rick en cada multiverso, siempre me acompaña en cada aventura.',
    3: 'Summer Smith la hija de Beth y Jerry. Hermana de Morty. Tiene un gran espíritu rebelde y siempre puedo contar con ella para limpiar algunos desastres',
    4: 'Mi hija Beth. Vive un matrimonio aburrido con Jerry. Por eso le dí una oportunidad para viajar por el universo.',
    5: 'Jerry Smith, un fracasado cobarde, se casó con Beth y tuvo a Morty y Summer. Su mayor logro seguir con vida.',
    47: 'Mi mejor amigo, me ayudó a buscar a Rick Prime por todos los multiversos. Fue un gran amigo hasta que esa maldita lo convirtió en un cyborg. Junté sus partes y lo restauré. Ahora está en búsqueda de su hija.',
    94: 'Mi querida Diane. Desde aquel día estuve en búsqueda de Rick Prime por lo que te hizo. Desde entonces solo vive en mis recuerdos.',
    107: 'La doctora Wong, mi terapeuta personal. Varias veces me ha ayudado con algunos problemas personales.',
    118: 'Morty malvado es una variante de un universo externo. No tengo mucha información sobre él pero sé que no debo bajar la guardia.',
    242: 'Este es un Mr. Meeseeks. Existen para un único propósito y luego dejan de existir. Pensándolo bien debí dejar que uno de esos hiciera este trabajo.',
    265: 'El maravilloso e inigualable. PICKLE RICK!!!! Mira soy un pepinillo jajaja',
    372: 'Unity es una mente colmena que puede tomar la forma de cualquier ser vivo que asimile. Fue una excelente pareja en todos los sentidos.',
    564: 'Este maldito gato. No hay descripción para lo que almacena en su perturbada mente. Dios necesito borrer esos recuerdos de nuevo.',
  };

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
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: AutoRouter.of(context).maybePop,
                      behavior: HitTestBehavior.opaque,
                      child: const SizedBox(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Icon(
                            Icons.chevron_left,
                            size: 36,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppText.medium(
                        widget.character.name ?? '',
                        fontColor: ColorsConstant.mantis,
                        fontSize: 20,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Hero(
                      tag: widget.character.heroTag,
                      child: AppImage.network(
                        width: 320,
                        height: 320,
                        asset: widget.character.image ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CharacterContentDescription.origin(characterLocation: widget.character.origin),
              const SizedBox(height: 24),
              CharacterContentDescription.location(characterLocation: widget.character.location),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomPaint(
                  painter: AppCoachBottomRightIndicatorPainter(
                    radius: 24,
                    color: ColorsConstant.white,
                    triangleSide: 20,
                    rightSpace: 56,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Builder(
                            builder: (context) {
                              var phrase = fixedPhrases[widget.character.id];
                              if (phrase == null) {
                                final phrases = customPhrases[widget.character.gender?.toLowerCase()] ?? <String>[];
                                final randomIndex = phrases.isNotEmpty ? random.nextInt(phrases.length) : 0;
                                phrase = phrases.isNotEmpty ? phrases[randomIndex] : '';
                                phrase = phrase.replaceAll('{name}', widget.character.name ?? '');
                                if (widget.character.gender?.toGenderEnum == CharacterGender.male) {
                                  final specie = widget.character.species?.toSpecieEnum;
                                  switch(specie){
                                    case CharacterSpecies.human:
                                      phrase = phrase.replaceAll('{specie}', 'humano');
                                    case CharacterSpecies.alien:
                                      phrase = phrase.replaceAll('{specie}', 'alien');
                                    default:
                                      phrase = phrase.replaceAll('{specie}', '???');
                                  }
                                  final status = widget.character.status?.toStatusEnum;
                                  switch(status){
                                    case CharacterStatus.alive:
                                      phrase = phrase.replaceAll('{status}', 'vivo');
                                    case CharacterStatus.dead:
                                      phrase = phrase.replaceAll('{status}', 'muerto');
                                    default:
                                      phrase = phrase.replaceAll('{status}', 'muerto');
                                  }
                                } else if (widget.character.gender?.toGenderEnum == CharacterGender.female) {
                                  final specie = widget.character.species?.toSpecieEnum;
                                  switch(specie){
                                    case CharacterSpecies.human:
                                      phrase = phrase.replaceAll('{specie}', 'humana');
                                    case CharacterSpecies.alien:
                                      phrase = phrase.replaceAll('{specie}', 'alien');
                                    default:
                                      phrase = phrase.replaceAll('{specie}', '???');
                                  }
                                  final status = widget.character.status?.toStatusEnum;
                                  switch(status){
                                    case CharacterStatus.alive:
                                      phrase = phrase.replaceAll('{status}', 'viva');
                                    default:
                                      phrase = phrase.replaceAll('{status}', 'muerta');
                                  }
                                } else {
                                  final specie = widget.character.species?.toSpecieEnum;
                                  switch(specie){
                                    case CharacterSpecies.human:
                                      phrase = phrase.replaceAll('{specie}', 'humano');
                                    case CharacterSpecies.alien:
                                      phrase = phrase.replaceAll('{specie}', 'alien');
                                    default:
                                      phrase = phrase.replaceAll('{specie}', '???');
                                  }
                                  final status = widget.character.status?.toStatusEnum;
                                  switch(status){
                                    case CharacterStatus.alive:
                                      phrase = phrase.replaceAll('{status}', 'vivo');
                                    default:
                                      phrase = phrase.replaceAll('{status}', 'muerto');
                                  }
                                }
                              }
                              return AppAnimatedText.normal(
                                phrase,
                                fontColor: ColorsConstant.moonstone,
                                fontSize: 20,
                                textAlign: TextAlign.start,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 160,
                  width: 160,
                  child: AppImage.assetImage(
                    asset: 'assets/images/rick.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get statusTag {
    switch(widget.character.status?.toStatusEnum){
      case CharacterStatus.dead:
        return const AppImage.assetSvg(
          asset: 'assets/vector/dead_icon.svg',
          color: Colors.black,
          size: 16,
        );
      default:
        return const SizedBox();
    }
  }

  Widget get genderTag {
    switch(widget.character.gender?.toGenderEnum){
      case CharacterGender.male:
        return const Icon(
          Icons.male,
          color: Colors.blue,
          size: 24,
        );
      case CharacterGender.female:
        return const Icon(
          Icons.female,
          color: Colors.pink,
          size: 24,
        );
      default:
        return const SizedBox();
    }
  }
}
