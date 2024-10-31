
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:qualifacts_case/services/characters_service/characters_service.dart';
import 'package:qualifacts_case/services/characters_service/models/request/fetch_characters_request.dart';
import 'package:qualifacts_case/services/characters_service/models/response/fetch_characters_response.dart';

part 'fetch_characters_bloc.freezed.dart';

@freezed
class FetchCharactersEvent with _$FetchCharactersEvent {
  const factory FetchCharactersEvent.fetchCharacters({ required FetchCharactersRequest request }) = FetchCharacters;
}

@freezed
class FetchCharactersState with _$FetchCharactersState {
  const factory FetchCharactersState.fetchCharactersUninitializedState() = FetchCharactersUninitializedState;
  const factory FetchCharactersState.fetchCharactersLoadingState() = FetchCharactersLoadingState;
  const factory FetchCharactersState.fetchFilterNextCharactersLoadingState() = FetchFilterNextCharactersLoadingState;
  const factory FetchCharactersState.fetchCharactersSuccessState() = FetchCharactersSuccessState;
  const factory FetchCharactersState.fetchCharactersErrorState({@Default('') String message}) = FetchCharactersErrorState;
  const factory FetchCharactersState.fetchCharactersConnectionErrorState() = FetchCharactersConnectionErrorState;
  const factory FetchCharactersState.fetchCharactersUnauthorizedState() = FetchCharactersUnauthorizedState;
}

@injectable
class FetchCharactersBloc extends Bloc<FetchCharactersEvent, FetchCharactersState> {
  FetchCharactersBloc(this._charactersService) : super(const FetchCharactersUninitializedState()) {
    on<FetchCharactersEvent>(_onFetchCharactersEvent);
  }

  final CharactersService _charactersService;

  var _characters = <CharacterResult>[];

  List<CharacterResult> get characters => _characters;

  void _onFetchCharactersEvent(FetchCharactersEvent event, Emitter<FetchCharactersState> emitter) async {
    try {
      await event.when(
          fetchCharacters: (request) async {
            request.page == 0 ? emitter(const FetchCharactersLoadingState()) : emitter(const FetchFilterNextCharactersLoadingState());
            final data = await _charactersService.fetchCharacters(request: request);
            _characters = request.page == 0 ? data.results : [..._characters, ...data.results];
            emitter(const FetchCharactersSuccessState());
          },
      );
    } on DioException catch (e) {
      var data = e.response?.data is Map ? e.response?.data as Map : null;
      var message = data?['detail'] as String?;
      message ??= e.response?.data is String? ? (e.response?.data as String?) : null;
      message ??= e.response?.statusMessage ?? '';
      emitter(FetchCharactersErrorState(message: message));
    } catch (e) {
      // Or else display any exception as error
      emitter(FetchCharactersErrorState(message: e.toString()));
    }
  }
}
