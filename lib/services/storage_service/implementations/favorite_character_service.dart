import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:qualifacts_case/services/storage_service/database.dart';

@injectable
class FavoriteCharacterService {
  final AppDatabase _database;

  FavoriteCharacterService(this._database);

  Future<int> insert({
    required int characterId,
    required String characterName,
    required String characterImage,
    bool isFavorite = true,
  }) => _database.into(_database.favoriteCharacter).insert(
    FavoriteCharacterCompanion.insert(
      characterId: Value<int>(characterId),
      characterName: Value<String>(characterName),
      characterImage: Value<String>(characterImage),
      isFavorite: Value<bool>(isFavorite),
    ),
  );
  Future<int> changeFavorite({
    required int id,
    required bool isFavorite,
  }) => (_database.update(_database.favoriteCharacter)
      ..where((tbl) => tbl.id.equals(id)))
      .write(FavoriteCharacterCompanion(isFavorite: Value<bool>(isFavorite)));
  Future<int> delete({required int id}) => (_database.delete(_database.favoriteCharacter)..where((tbl) => tbl.id.equals(id))).go();
  Future<List<FavoriteCharacterData>> getAll() => _database.select(_database.favoriteCharacter).get();
  Future<FavoriteCharacterData> get({ required int id }) => (_database.select(_database.favoriteCharacter)..where((tbl) => tbl.id.equals(id))).getSingle();
  Future<FavoriteCharacterData?> getByCharacterId({ required int characterId }) => (_database.select(_database.favoriteCharacter)..where((tbl) => tbl.characterId.equals(characterId))).getSingleOrNull();
}