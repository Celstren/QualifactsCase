import 'package:qualifacts_case/services/characters_service/models/response/fetch_characters_response.dart';
import 'package:qualifacts_case/services/storage_service/database.dart';

extension FavoriteCharacterDataExtension on FavoriteCharacterData {
  CharacterResult get toCharacter => CharacterResult(
    id: characterId,
    image: characterImage,
    name: characterName,
    heroTag: 'favorite_$id',
  );
}