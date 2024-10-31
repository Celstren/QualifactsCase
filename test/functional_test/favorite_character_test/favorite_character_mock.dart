import 'package:mockito/mockito.dart';
import 'package:qualifacts_case/services/storage_service/database.dart';
import 'package:qualifacts_case/services/storage_service/implementations/favorite_character_service.dart';

class MockFavoriteCharacterService extends Mock implements FavoriteCharacterService {
  final rickJson = <String, dynamic>{
    'id': 1,
    'name': 'Rick Sanchez',
    'status': 'Alive',
    'species': 'Human',
    'type': '',
    'gender': 'Male',
    'origin': {
      'name': 'Earth (C-137)',
      'url': 'https://rickandmortyapi.com/api/location/1'
    },
    'location': {
      'name': 'Citadel of Ricks',
      'url': 'https://rickandmortyapi.com/api/location/3'
    },
    'image': 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    'episode': [
      'https://rickandmortyapi.com/api/episode/1',
      'https://rickandmortyapi.com/api/episode/2',
      'https://rickandmortyapi.com/api/episode/3',
      'https://rickandmortyapi.com/api/episode/4',
      'https://rickandmortyapi.com/api/episode/5',
      'https://rickandmortyapi.com/api/episode/6',
      'https://rickandmortyapi.com/api/episode/7',
      'https://rickandmortyapi.com/api/episode/8',
      'https://rickandmortyapi.com/api/episode/9',
      'https://rickandmortyapi.com/api/episode/10',
      'https://rickandmortyapi.com/api/episode/11',
      'https://rickandmortyapi.com/api/episode/12',
      'https://rickandmortyapi.com/api/episode/13',
      'https://rickandmortyapi.com/api/episode/14',
      'https://rickandmortyapi.com/api/episode/15',
      'https://rickandmortyapi.com/api/episode/16',
      'https://rickandmortyapi.com/api/episode/17',
      'https://rickandmortyapi.com/api/episode/18',
      'https://rickandmortyapi.com/api/episode/19',
      'https://rickandmortyapi.com/api/episode/20',
      'https://rickandmortyapi.com/api/episode/21',
      'https://rickandmortyapi.com/api/episode/22',
      'https://rickandmortyapi.com/api/episode/23',
      'https://rickandmortyapi.com/api/episode/24',
      'https://rickandmortyapi.com/api/episode/25',
      'https://rickandmortyapi.com/api/episode/26',
      'https://rickandmortyapi.com/api/episode/27',
      'https://rickandmortyapi.com/api/episode/28',
      'https://rickandmortyapi.com/api/episode/29',
      'https://rickandmortyapi.com/api/episode/30',
      'https://rickandmortyapi.com/api/episode/31',
      'https://rickandmortyapi.com/api/episode/32',
      'https://rickandmortyapi.com/api/episode/33',
      'https://rickandmortyapi.com/api/episode/34',
      'https://rickandmortyapi.com/api/episode/35',
      'https://rickandmortyapi.com/api/episode/36',
      'https://rickandmortyapi.com/api/episode/37',
      'https://rickandmortyapi.com/api/episode/38',
      'https://rickandmortyapi.com/api/episode/39',
      'https://rickandmortyapi.com/api/episode/40',
      'https://rickandmortyapi.com/api/episode/41',
      'https://rickandmortyapi.com/api/episode/42',
      'https://rickandmortyapi.com/api/episode/43',
      'https://rickandmortyapi.com/api/episode/44',
      'https://rickandmortyapi.com/api/episode/45',
      'https://rickandmortyapi.com/api/episode/46',
      'https://rickandmortyapi.com/api/episode/47',
      'https://rickandmortyapi.com/api/episode/48',
      'https://rickandmortyapi.com/api/episode/49',
      'https://rickandmortyapi.com/api/episode/50',
      'https://rickandmortyapi.com/api/episode/51'
    ],
    'url': 'https://rickandmortyapi.com/api/character/1',
    'created': '2017-11-04T18:48:46.250Z'
  };
  final mortyJson = <String, dynamic>{
    'id': 2,
    'name': 'Morty Smith',
    'status': 'Alive',
    'species': 'Human',
    'type': '',
    'gender': 'Male',
    'origin': {'name': 'unknown', 'url': ''},
    'location': {
      'name': 'Citadel of Ricks',
      'url': 'https://rickandmortyapi.com/api/location/3'
    },
    'image': 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
    'episode': [
      'https://rickandmortyapi.com/api/episode/1',
      'https://rickandmortyapi.com/api/episode/2',
      'https://rickandmortyapi.com/api/episode/3',
      'https://rickandmortyapi.com/api/episode/4',
      'https://rickandmortyapi.com/api/episode/5',
      'https://rickandmortyapi.com/api/episode/6',
      'https://rickandmortyapi.com/api/episode/7',
      'https://rickandmortyapi.com/api/episode/8',
      'https://rickandmortyapi.com/api/episode/9',
      'https://rickandmortyapi.com/api/episode/10',
      'https://rickandmortyapi.com/api/episode/11',
      'https://rickandmortyapi.com/api/episode/12',
      'https://rickandmortyapi.com/api/episode/13',
      'https://rickandmortyapi.com/api/episode/14',
      'https://rickandmortyapi.com/api/episode/15',
      'https://rickandmortyapi.com/api/episode/16',
      'https://rickandmortyapi.com/api/episode/17',
      'https://rickandmortyapi.com/api/episode/18',
      'https://rickandmortyapi.com/api/episode/19',
      'https://rickandmortyapi.com/api/episode/20',
      'https://rickandmortyapi.com/api/episode/21',
      'https://rickandmortyapi.com/api/episode/22',
      'https://rickandmortyapi.com/api/episode/23',
      'https://rickandmortyapi.com/api/episode/24',
      'https://rickandmortyapi.com/api/episode/25',
      'https://rickandmortyapi.com/api/episode/26',
      'https://rickandmortyapi.com/api/episode/27',
      'https://rickandmortyapi.com/api/episode/28',
      'https://rickandmortyapi.com/api/episode/29',
      'https://rickandmortyapi.com/api/episode/30',
      'https://rickandmortyapi.com/api/episode/31',
      'https://rickandmortyapi.com/api/episode/32',
      'https://rickandmortyapi.com/api/episode/33',
      'https://rickandmortyapi.com/api/episode/34',
      'https://rickandmortyapi.com/api/episode/35',
      'https://rickandmortyapi.com/api/episode/36',
      'https://rickandmortyapi.com/api/episode/37',
      'https://rickandmortyapi.com/api/episode/38',
      'https://rickandmortyapi.com/api/episode/39',
      'https://rickandmortyapi.com/api/episode/40',
      'https://rickandmortyapi.com/api/episode/41',
      'https://rickandmortyapi.com/api/episode/42',
      'https://rickandmortyapi.com/api/episode/43',
      'https://rickandmortyapi.com/api/episode/44',
      'https://rickandmortyapi.com/api/episode/45',
      'https://rickandmortyapi.com/api/episode/46',
      'https://rickandmortyapi.com/api/episode/47',
      'https://rickandmortyapi.com/api/episode/48',
      'https://rickandmortyapi.com/api/episode/49',
      'https://rickandmortyapi.com/api/episode/50',
      'https://rickandmortyapi.com/api/episode/51'
    ],
    'url': 'https://rickandmortyapi.com/api/character/2',
    'created': '2017-11-04T18:50:21.651Z'
  };
  final summerJson = <String, dynamic>{
    'id': 3,
    'name': 'Summer Smith',
    'status': 'Alive',
    'species': 'Human',
    'type': '',
    'gender': 'Female',
    'origin': {
      'name': 'Earth (Replacement Dimension)',
      'url': 'https://rickandmortyapi.com/api/location/20'
    },
    'location': {
      'name': 'Earth (Replacement Dimension)',
      'url': 'https://rickandmortyapi.com/api/location/20'
    },
    'image': 'https://rickandmortyapi.com/api/character/avatar/3.jpeg',
    'episode': [
      'https://rickandmortyapi.com/api/episode/6',
      'https://rickandmortyapi.com/api/episode/7',
      'https://rickandmortyapi.com/api/episode/8',
      'https://rickandmortyapi.com/api/episode/9',
      'https://rickandmortyapi.com/api/episode/10',
      'https://rickandmortyapi.com/api/episode/11',
      'https://rickandmortyapi.com/api/episode/12',
      'https://rickandmortyapi.com/api/episode/14',
      'https://rickandmortyapi.com/api/episode/15',
      'https://rickandmortyapi.com/api/episode/16',
      'https://rickandmortyapi.com/api/episode/17',
      'https://rickandmortyapi.com/api/episode/18',
      'https://rickandmortyapi.com/api/episode/19',
      'https://rickandmortyapi.com/api/episode/20',
      'https://rickandmortyapi.com/api/episode/21',
      'https://rickandmortyapi.com/api/episode/22',
      'https://rickandmortyapi.com/api/episode/23',
      'https://rickandmortyapi.com/api/episode/24',
      'https://rickandmortyapi.com/api/episode/25',
      'https://rickandmortyapi.com/api/episode/26',
      'https://rickandmortyapi.com/api/episode/27',
      'https://rickandmortyapi.com/api/episode/29',
      'https://rickandmortyapi.com/api/episode/30',
      'https://rickandmortyapi.com/api/episode/31',
      'https://rickandmortyapi.com/api/episode/32',
      'https://rickandmortyapi.com/api/episode/33',
      'https://rickandmortyapi.com/api/episode/34',
      'https://rickandmortyapi.com/api/episode/35',
      'https://rickandmortyapi.com/api/episode/36',
      'https://rickandmortyapi.com/api/episode/38',
      'https://rickandmortyapi.com/api/episode/39',
      'https://rickandmortyapi.com/api/episode/40',
      'https://rickandmortyapi.com/api/episode/41',
      'https://rickandmortyapi.com/api/episode/42',
      'https://rickandmortyapi.com/api/episode/43',
      'https://rickandmortyapi.com/api/episode/44',
      'https://rickandmortyapi.com/api/episode/45',
      'https://rickandmortyapi.com/api/episode/46',
      'https://rickandmortyapi.com/api/episode/47',
      'https://rickandmortyapi.com/api/episode/48',
      'https://rickandmortyapi.com/api/episode/49',
      'https://rickandmortyapi.com/api/episode/51'
    ],
    'url': 'https://rickandmortyapi.com/api/character/3',
    'created': '2017-11-04T19:09:56.428Z'
  };
  final bethJson = <String, dynamic>{
    'id': 4,
    'name': 'Beth Smith',
    'status': 'Alive',
    'species': 'Human',
    'type': '',
    'gender': 'Female',
    'origin': {
      'name': 'Earth (Replacement Dimension)',
      'url': 'https://rickandmortyapi.com/api/location/20'
    },
    'location': {
      'name': 'Earth (Replacement Dimension)',
      'url': 'https://rickandmortyapi.com/api/location/20'
    },
    'image': 'https://rickandmortyapi.com/api/character/avatar/4.jpeg',
    'episode': [
      'https://rickandmortyapi.com/api/episode/6',
      'https://rickandmortyapi.com/api/episode/7',
      'https://rickandmortyapi.com/api/episode/8',
      'https://rickandmortyapi.com/api/episode/9',
      'https://rickandmortyapi.com/api/episode/10',
      'https://rickandmortyapi.com/api/episode/11',
      'https://rickandmortyapi.com/api/episode/12',
      'https://rickandmortyapi.com/api/episode/14',
      'https://rickandmortyapi.com/api/episode/15',
      'https://rickandmortyapi.com/api/episode/16',
      'https://rickandmortyapi.com/api/episode/18',
      'https://rickandmortyapi.com/api/episode/19',
      'https://rickandmortyapi.com/api/episode/20',
      'https://rickandmortyapi.com/api/episode/21',
      'https://rickandmortyapi.com/api/episode/22',
      'https://rickandmortyapi.com/api/episode/23',
      'https://rickandmortyapi.com/api/episode/24',
      'https://rickandmortyapi.com/api/episode/25',
      'https://rickandmortyapi.com/api/episode/26',
      'https://rickandmortyapi.com/api/episode/27',
      'https://rickandmortyapi.com/api/episode/28',
      'https://rickandmortyapi.com/api/episode/29',
      'https://rickandmortyapi.com/api/episode/30',
      'https://rickandmortyapi.com/api/episode/31',
      'https://rickandmortyapi.com/api/episode/32',
      'https://rickandmortyapi.com/api/episode/33',
      'https://rickandmortyapi.com/api/episode/34',
      'https://rickandmortyapi.com/api/episode/35',
      'https://rickandmortyapi.com/api/episode/36',
      'https://rickandmortyapi.com/api/episode/38',
      'https://rickandmortyapi.com/api/episode/39',
      'https://rickandmortyapi.com/api/episode/40',
      'https://rickandmortyapi.com/api/episode/41',
      'https://rickandmortyapi.com/api/episode/42',
      'https://rickandmortyapi.com/api/episode/43',
      'https://rickandmortyapi.com/api/episode/44',
      'https://rickandmortyapi.com/api/episode/45',
      'https://rickandmortyapi.com/api/episode/46',
      'https://rickandmortyapi.com/api/episode/47',
      'https://rickandmortyapi.com/api/episode/48',
      'https://rickandmortyapi.com/api/episode/49',
      'https://rickandmortyapi.com/api/episode/51'
    ],
    'url': 'https://rickandmortyapi.com/api/character/4',
    'created': '2017-11-04T19:22:43.665Z'
  };
  final jerryJson = <String, dynamic>{
    'id': 5,
    'name': 'Jerry Smith',
    'status': 'Alive',
    'species': 'Human',
    'type': '',
    'gender': 'Male',
    'origin': {
      'name': 'Earth (Replacement Dimension)',
      'url': 'https://rickandmortyapi.com/api/location/20'
    },
    'location': {
      'name': 'Earth (Replacement Dimension)',
      'url': 'https://rickandmortyapi.com/api/location/20'
    },
    'image': 'https://rickandmortyapi.com/api/character/avatar/5.jpeg',
    'episode': [
      'https://rickandmortyapi.com/api/episode/6',
      'https://rickandmortyapi.com/api/episode/7',
      'https://rickandmortyapi.com/api/episode/8',
      'https://rickandmortyapi.com/api/episode/9',
      'https://rickandmortyapi.com/api/episode/10',
      'https://rickandmortyapi.com/api/episode/11',
      'https://rickandmortyapi.com/api/episode/12',
      'https://rickandmortyapi.com/api/episode/13',
      'https://rickandmortyapi.com/api/episode/14',
      'https://rickandmortyapi.com/api/episode/15',
      'https://rickandmortyapi.com/api/episode/16',
      'https://rickandmortyapi.com/api/episode/18',
      'https://rickandmortyapi.com/api/episode/19',
      'https://rickandmortyapi.com/api/episode/20',
      'https://rickandmortyapi.com/api/episode/21',
      'https://rickandmortyapi.com/api/episode/22',
      'https://rickandmortyapi.com/api/episode/23',
      'https://rickandmortyapi.com/api/episode/26',
      'https://rickandmortyapi.com/api/episode/29',
      'https://rickandmortyapi.com/api/episode/30',
      'https://rickandmortyapi.com/api/episode/31',
      'https://rickandmortyapi.com/api/episode/32',
      'https://rickandmortyapi.com/api/episode/33',
      'https://rickandmortyapi.com/api/episode/35',
      'https://rickandmortyapi.com/api/episode/36',
      'https://rickandmortyapi.com/api/episode/38',
      'https://rickandmortyapi.com/api/episode/39',
      'https://rickandmortyapi.com/api/episode/40',
      'https://rickandmortyapi.com/api/episode/41',
      'https://rickandmortyapi.com/api/episode/42',
      'https://rickandmortyapi.com/api/episode/43',
      'https://rickandmortyapi.com/api/episode/44',
      'https://rickandmortyapi.com/api/episode/45',
      'https://rickandmortyapi.com/api/episode/46',
      'https://rickandmortyapi.com/api/episode/47',
      'https://rickandmortyapi.com/api/episode/48',
      'https://rickandmortyapi.com/api/episode/49',
      'https://rickandmortyapi.com/api/episode/50',
      'https://rickandmortyapi.com/api/episode/51'
    ],
    'url': 'https://rickandmortyapi.com/api/character/5',
    'created': '2017-11-04T19:26:56.301Z'
  };
  FavoriteCharacterData? newSavedFavorite;
  var savedMorty = const FavoriteCharacterData(id: 2, characterId: 2, characterImage: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg', characterName: 'Morty Smith', isFavorite: false);
  var savedSummer = const FavoriteCharacterData(id: 3, characterId: 3, characterImage: 'https://rickandmortyapi.com/api/character/avatar/3.jpeg', characterName: 'Summer Smith', isFavorite: true);
  var savedBeth = const FavoriteCharacterData(id: 4, characterId: 4, characterImage: 'https://rickandmortyapi.com/api/character/avatar/4.jpeg', characterName: 'Beth Smith', isFavorite: true);
  var savedJerry = const FavoriteCharacterData(id: 5, characterId: 5, characterImage: 'https://rickandmortyapi.com/api/character/avatar/5.jpeg', characterName: 'Jerry Smith', isFavorite: false);
  var savedFavorite = const FavoriteCharacterData(id: 0, characterId: 0, characterImage: '', characterName: '', isFavorite: true);
  var savedNonFavorite = const FavoriteCharacterData(id: 0, characterId: 0, characterImage: '', characterName: '', isFavorite: false);
  final timeToLoad = const Duration(milliseconds: 400);

  @override
  Future<List<FavoriteCharacterData>> getAll() async {
    await Future.delayed(timeToLoad);
    return [ savedFavorite, savedNonFavorite ];
  }

  @override
  Future<FavoriteCharacterData?> getByCharacterId({required int characterId}) async {
    await Future.delayed(timeToLoad);
    if (characterId == 2) return savedMorty;
    if (characterId == 3) return savedSummer;
    if (characterId == 4) return savedBeth;
    if (characterId == 5) return savedJerry;
    return null;
  }

  @override
  Future<int> insert({required int characterId, required String characterName, required String characterImage, bool isFavorite = true}) async {
    await Future.delayed(timeToLoad);
    newSavedFavorite = const FavoriteCharacterData(id: 1, characterId: 1, characterImage: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg', characterName: 'Rick Sanchez', isFavorite: true);
    return newSavedFavorite!.id;
  }

  @override
  Future<int> changeFavorite({required int id, required bool isFavorite}) async {
    await Future.delayed(timeToLoad);
    if (id == 2) {
      savedMorty = FavoriteCharacterData(id: 2, characterId: 2, characterImage: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg', characterName: 'Morty Smith', isFavorite: isFavorite);
      return 2;
    }
    if (id == 3) {
      savedSummer = FavoriteCharacterData(id: 3, characterId: 3, characterImage: 'https://rickandmortyapi.com/api/character/avatar/3.jpeg', characterName: 'Summer Smith', isFavorite: isFavorite);
      return 3;
    }
    return id;
  }
}