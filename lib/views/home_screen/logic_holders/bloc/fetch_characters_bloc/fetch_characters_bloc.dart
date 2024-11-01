
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:qualifacts_case/networking/app_api_exception.dart';
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
  const factory FetchCharactersState.fetchNextCharactersLoadingState() = FetchNextCharactersLoadingState;
  const factory FetchCharactersState.fetchCharactersSuccessState() = FetchCharactersSuccessState;
  const factory FetchCharactersState.fetchCharactersErrorState({@Default('') String message}) = FetchCharactersErrorState;
}

@injectable
class FetchCharactersBloc extends Bloc<FetchCharactersEvent, FetchCharactersState> {
  FetchCharactersBloc(this._charactersService) : super(const FetchCharactersUninitializedState()) {
    on<FetchCharactersEvent>(_onFetchCharactersEvent);
  }

  final CharactersService _charactersService;

  var _characters = <CharacterResult>[];
  PaginationInfo? _info;

  List<CharacterResult> get characters => _characters;

  void _onFetchCharactersEvent(FetchCharactersEvent event, Emitter<FetchCharactersState> emitter) async {
    try {
      await event.when(
          fetchCharacters: (request) async {
            if (state is FetchNextCharactersLoadingState || state is FetchCharactersLoadingState) return;
            if (_info != null && _info!.count != null && request.page > 1 && (_info!.pages!) <= (request.page)) return;
            request.page > 1 ? emitter(const FetchNextCharactersLoadingState()) : emitter(const FetchCharactersLoadingState());
            final data = await _charactersService.fetchCharacters(request: request);
            _characters = request.page > 1 ? [..._characters, ...data.results] : data.results;
            _info = data.info;
            emitter(const FetchCharactersSuccessState());
          },
      );
    } on AppApiException catch(e) {
      emitter(FetchCharactersErrorState(message: e.message));
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
