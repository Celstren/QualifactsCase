import 'package:flutter_test/flutter_test.dart';
import 'package:qualifacts_case/services/characters_service/models/response/fetch_characters_response.dart';
import 'package:qualifacts_case/views/character_screen/bloc/favorite_character_bloc/favorite_character_bloc.dart';
import 'package:qualifacts_case/views/character_screen/bloc/validate_favorite_character_bloc/validate_favorite_character_bloc.dart';
import 'package:qualifacts_case/views/favorite_character_screen/logic_holders/bloc/fetch_favorite_characters_bloc/fetch_favorite_characters_bloc.dart';

import 'favorite_character_mock.dart';

void main() {
  late final FavoriteCharacterBloc favoriteCharacterBloc;
  late final ValidateFavoriteCharacterBloc validateFavoriteCharacterBloc;
  late final FetchFavoriteCharactersBloc fetchFavoriteCharactersBloc;
  late final MockFavoriteCharacterService mockFavoriteCharacterService;

  setUpAll(() {
    mockFavoriteCharacterService = MockFavoriteCharacterService();
    favoriteCharacterBloc = FavoriteCharacterBloc(mockFavoriteCharacterService);
    validateFavoriteCharacterBloc = ValidateFavoriteCharacterBloc(mockFavoriteCharacterService);
    fetchFavoriteCharactersBloc = FetchFavoriteCharactersBloc(mockFavoriteCharacterService);
  });

  tearDownAll(() {
    favoriteCharacterBloc.close();
    validateFavoriteCharacterBloc.close();
    fetchFavoriteCharactersBloc.close();
  });

  group('Favorite Character Bloc', () {
    test('Uninitialized State', () {
      expect(favoriteCharacterBloc.state, const FavoriteCharacterUninitializedState());
    });

    test('Register Favorite Characters', () async {
      favoriteCharacterBloc.add(FavoriteCharacter(character: CharacterResult.fromJson(mockFavoriteCharacterService.rickJson)));
      await Future.delayed(Duration(milliseconds: (mockFavoriteCharacterService.timeToLoad.inMilliseconds * .1).toInt()));
      expect(favoriteCharacterBloc.state, const FavoriteCharacterLoadingState(), reason: 'Bloc must change state to loading state');
      await Future.delayed(mockFavoriteCharacterService.timeToLoad * 2);
      expect(favoriteCharacterBloc.state, const FavoriteCharacterSuccessState(id: 1), reason: 'Bloc must change state to success state');
      expect(mockFavoriteCharacterService.newSavedFavorite, isNot(null), reason: 'Registered Character must not be null');
      expect(mockFavoriteCharacterService.newSavedFavorite?.isFavorite, true, reason: 'Registered Character must be favorite');
    });

    test('Enable Favorite Characters ', () async {
      favoriteCharacterBloc.add(FavoriteCharacter(character: CharacterResult.fromJson(mockFavoriteCharacterService.mortyJson)));
      await Future.delayed(Duration(milliseconds: (mockFavoriteCharacterService.timeToLoad.inMilliseconds * .1).toInt()));
      expect(favoriteCharacterBloc.state, const FavoriteCharacterLoadingState(), reason: 'Bloc must change state to loading state');
      await Future.delayed(mockFavoriteCharacterService.timeToLoad * 2);
      expect(favoriteCharacterBloc.state, const FavoriteCharacterSuccessState(id: 2), reason: 'Bloc must change state to success state');
      expect(mockFavoriteCharacterService.savedMorty.isFavorite, true);
    });

    test('Disable Favorite Characters', () async {
      favoriteCharacterBloc.add(FavoriteCharacter(character: CharacterResult.fromJson(mockFavoriteCharacterService.summerJson)));
      await Future.delayed(Duration(milliseconds: (mockFavoriteCharacterService.timeToLoad.inMilliseconds * .1).toInt()));
      expect(favoriteCharacterBloc.state, const FavoriteCharacterLoadingState(), reason: 'Bloc must change state to loading state');
      await Future.delayed(mockFavoriteCharacterService.timeToLoad * 2);
      expect(favoriteCharacterBloc.state, const FavoriteCharacterSuccessState(id: 3), reason: 'Bloc must change state to success state');
      expect(mockFavoriteCharacterService.savedSummer.isFavorite, false);
    });

    test('Error Favorite Characters', () async {
      favoriteCharacterBloc.add(FavoriteCharacter(character: CharacterResult(id: null)));
      await Future.delayed(mockFavoriteCharacterService.timeToLoad);
      expect(favoriteCharacterBloc.state, const FavoriteCharacterErrorState(message: 'El personaje no cuenta con un id válido'), reason: 'Bloc must change state to error state');
    });
  });

  group('Validate Favorite Character Bloc', () {
    test('Uninitialized State', () {
      expect(validateFavoriteCharacterBloc.state, const ValidateFavoriteCharacterUninitializedState());
    });

    test('Validate Non Registered Favorite', () async {
      validateFavoriteCharacterBloc.add(const ValidateFavoriteCharacter(characterId: 0));
      await Future.delayed(Duration(milliseconds: (mockFavoriteCharacterService.timeToLoad.inMilliseconds * .1).toInt()));
      expect(validateFavoriteCharacterBloc.state, const ValidateFavoriteCharacterLoadingState(), reason: 'Bloc must change state to loading state');
      await Future.delayed(mockFavoriteCharacterService.timeToLoad);
      expect(validateFavoriteCharacterBloc.state, const ValidateFavoriteCharacterSuccessState(isFavorite: false), reason: 'Bloc must change state to success state with false');
    });

    test('Validate Registered Favorite', () async {
      validateFavoriteCharacterBloc.add(const ValidateFavoriteCharacter(characterId: 4));
      await Future.delayed(Duration(milliseconds: (mockFavoriteCharacterService.timeToLoad.inMilliseconds * .1).toInt()));
      expect(validateFavoriteCharacterBloc.state, const ValidateFavoriteCharacterLoadingState(), reason: 'Bloc must change state to loading state');
      await Future.delayed(mockFavoriteCharacterService.timeToLoad);
      expect(validateFavoriteCharacterBloc.state, const ValidateFavoriteCharacterSuccessState(isFavorite: true), reason: 'Bloc must change state to success state with true');
    });

    test('Validate Registered Non Favorite', () async {
      validateFavoriteCharacterBloc.add(const ValidateFavoriteCharacter(characterId: 5));
      await Future.delayed(Duration(milliseconds: (mockFavoriteCharacterService.timeToLoad.inMilliseconds * .1).toInt()));
      expect(validateFavoriteCharacterBloc.state, const ValidateFavoriteCharacterLoadingState(), reason: 'Bloc must change state to loading state');
      await Future.delayed(mockFavoriteCharacterService.timeToLoad);
      expect(validateFavoriteCharacterBloc.state, const ValidateFavoriteCharacterSuccessState(isFavorite: false), reason: 'Bloc must change state to success state with false');
    });
  });

  group('Fetch Favorite Characters Bloc', () {
    test('Uninitialized State', () {
      expect(fetchFavoriteCharactersBloc.state, const FetchFavoriteCharactersUninitializedState());
    });

    test('Load Favorite Characters', () async {
      fetchFavoriteCharactersBloc.add(const FetchFavoriteCharacters());
      await Future.delayed(Duration(milliseconds: (mockFavoriteCharacterService.timeToLoad.inMilliseconds * .1).toInt()));
      expect(fetchFavoriteCharactersBloc.state, const FetchFavoriteCharactersLoadingState(), reason: 'Bloc must change state to loading state');
      await Future.delayed(mockFavoriteCharacterService.timeToLoad);
      expect(fetchFavoriteCharactersBloc.state, const FetchFavoriteCharactersSuccessState(), reason: 'Bloc must change state to success state');
      expect(fetchFavoriteCharactersBloc.characters.length, 1, reason: 'Only one of the saved characters is favorite');
    });
  });
}