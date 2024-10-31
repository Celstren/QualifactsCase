import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:qualifacts_case/services/storage_service/database.dart';
import 'package:qualifacts_case/services/storage_service/implementations/favorite_character_service.dart';

part 'fetch_favorite_characters_bloc.freezed.dart';

@freezed
class FetchFavoriteCharactersEvent with _$FetchFavoriteCharactersEvent {
  const factory FetchFavoriteCharactersEvent.fetchFavoriteCharacters() = FetchFavoriteCharacters;
}

@freezed
class FetchFavoriteCharactersState with _$FetchFavoriteCharactersState {
  const factory FetchFavoriteCharactersState.fetchFavoriteCharactersUninitializedState() = FetchFavoriteCharactersUninitializedState;
  const factory FetchFavoriteCharactersState.fetchFavoriteCharactersLoadingState() = FetchFavoriteCharactersLoadingState;
  const factory FetchFavoriteCharactersState.fetchFavoriteCharactersSuccessState() = FetchFavoriteCharactersSuccessState;
  const factory FetchFavoriteCharactersState.fetchFavoriteCharactersErrorState({@Default('') String message}) = FetchFavoriteCharactersErrorState;
  const factory FetchFavoriteCharactersState.fetchFavoriteCharactersConnectionErrorState() = FetchFavoriteCharactersConnectionErrorState;
  const factory FetchFavoriteCharactersState.fetchFavoriteCharactersUnauthorizedState() = FetchFavoriteCharactersUnauthorizedState;
}

@injectable
class FetchFavoriteCharactersBloc extends Bloc<FetchFavoriteCharactersEvent, FetchFavoriteCharactersState> {
  FetchFavoriteCharactersBloc(this._favoriteCharacterService) : super(const FetchFavoriteCharactersUninitializedState()) {
    on<FetchFavoriteCharactersEvent>(_onFetchFavoriteCharactersEvent);
  }

  final FavoriteCharacterService _favoriteCharacterService;

  var _characters = <FavoriteCharacterData>[];

  List<FavoriteCharacterData> get characters => _characters;

  void _onFetchFavoriteCharactersEvent(FetchFavoriteCharactersEvent event, Emitter<FetchFavoriteCharactersState> emitter) async {
    try {
      await event.when(
        fetchFavoriteCharacters: () async {
          emitter(const FetchFavoriteCharactersLoadingState());
          final savedFavorites = await _favoriteCharacterService.getAll();
          _characters = savedFavorites.where((s) => s.isFavorite ?? false).toList();
          emitter(const FetchFavoriteCharactersSuccessState());
        },
      );
    } on DioException catch (e) {
      var data = e.response?.data is Map ? e.response?.data as Map : null;
      var message = data?['detail'] as String?;
      message ??= e.response?.data is String? ? (e.response?.data as String?) : null;
      message ??= e.response?.statusMessage ?? '';
      emitter(FetchFavoriteCharactersErrorState(message: message));
    } catch (e) {
      // Or else display any exception as error
      emitter(FetchFavoriteCharactersErrorState(message: e.toString()));
    }
  }
}
