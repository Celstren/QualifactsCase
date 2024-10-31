import 'package:drift/drift.dart';

class FavoriteCharacter extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get characterId => integer().nullable()();
  TextColumn get characterName => text().nullable()();
  TextColumn get characterImage => text().nullable()();
  BoolColumn get isFavorite => boolean().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
}