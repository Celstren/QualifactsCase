import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:qualifacts_case/services/storage_service/models/table/favorite_character.table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [FavoriteCharacter])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'qualifacts_database');
  }
}