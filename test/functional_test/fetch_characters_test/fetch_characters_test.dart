import 'package:flutter_test/flutter_test.dart';
import 'package:qualifacts_case/services/characters_service/models/request/fetch_characters_request.dart';
import 'package:qualifacts_case/views/home_screen/logic_holders/bloc/fetch_characters_bloc/fetch_characters_bloc.dart';
import 'fetch_characters_mock.dart';

void main() {
  late final FetchCharactersBloc fetchCharactersBloc;
  late final MockCharacterService mockCharacterService;

  setUpAll(() {
    mockCharacterService = MockCharacterService();
    fetchCharactersBloc = FetchCharactersBloc(mockCharacterService);
  });

  tearDownAll(() => fetchCharactersBloc.close());

  group('Fetch Characters Bloc', () {
    test('Uninitialized State', () {
      expect(fetchCharactersBloc.state, const FetchCharactersUninitializedState());
    });

    test('Load Characters', () async {
      final request = FetchCharactersRequest();
      expect(request.page, 1, reason: 'Default page should be 1 to avoid loading all items');
      fetchCharactersBloc.add(FetchCharacters(request: request));
      await Future.delayed(Duration(milliseconds: (mockCharacterService.timeToLoad.inMilliseconds * .1).toInt()));
      expect(fetchCharactersBloc.state, const FetchCharactersLoadingState(), reason: 'Bloc must change state to loading state');
      await Future.delayed(mockCharacterService.timeToLoad);
      expect(fetchCharactersBloc.state, const FetchCharactersSuccessState(), reason: 'Bloc must change state to success state');
      expect(fetchCharactersBloc.characters.isNotEmpty, true);
    });

    test('Load Next Characters', () async {
      final request = FetchCharactersRequest(page: 2);
      expect(request.page, 2, reason: 'Page should be 2 to display pagination loading');
      fetchCharactersBloc.add(FetchCharacters(request: request));
      await Future.delayed(Duration(milliseconds: (mockCharacterService.timeToLoad.inMilliseconds * .1).toInt()));
      expect(fetchCharactersBloc.state, const FetchNextCharactersLoadingState(), reason: 'Bloc must change state to loading next state');
      await Future.delayed(mockCharacterService.timeToLoad);
      expect(fetchCharactersBloc.state, const FetchCharactersSuccessState(), reason: 'Bloc must change state to success state');
      expect(fetchCharactersBloc.characters.isNotEmpty, true);
    });

    test('Load Characters Error', () async {
      final request = FetchCharactersRequest(page: 0);
      expect(request.page, 0, reason: 'Page should be 0 to throw Bad Request Exception');
      fetchCharactersBloc.add(FetchCharacters(request: request));
      await Future.delayed(Duration(milliseconds: (mockCharacterService.timeToLoad.inMilliseconds * .1).toInt()));
      expect(fetchCharactersBloc.state, const FetchCharactersLoadingState(), reason: 'Bloc must change state to loading state');
      await Future.delayed(mockCharacterService.timeToLoad);
      expect(fetchCharactersBloc.state, const FetchCharactersErrorState(message: 'Bad request page should be greater than 0'), reason: 'Bloc must change state to error state');
    });
  });
}