import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:qualifacts_case/services/characters_service/models/response/fetch_characters_response.dart';
import 'package:qualifacts_case/views/character_screen/presentation/content/character_content.dart';

@RoutePage(name: 'CharacterPageRoute')
class CharacterPage extends StatelessWidget {
  final CharacterResult character;
  const CharacterPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) => CharacterContent(character: character);
}
