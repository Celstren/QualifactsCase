import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:qualifacts_case/services/characters_service/models/response/fetch_characters_response.dart';
import 'package:qualifacts_case/services/storage_service/implementations/favorite_character_service.dart';

part 'favorite_character_bloc.freezed.dart';

@freezed
class FavoriteCharacterEvent with _$FavoriteCharacterEvent {
  const factory FavoriteCharacterEvent.favoriteCharacter({ required CharacterResult character }) = FavoriteCharacter;
}

@freezed
class FavoriteCharacterState with _$FavoriteCharacterState {
  const factory FavoriteCharacterState.favoriteCharacterUninitializedState() = FavoriteCharacterUninitializedState;
  const factory FavoriteCharacterState.favoriteCharacterLoadingState() = FavoriteCharacterLoadingState;
  const factory FavoriteCharacterState.favoriteCharacterSuccessState({ required int id }) = FavoriteCharacterSuccessState;
  const factory FavoriteCharacterState.favoriteCharacterErrorState({@Default('') String message}) = FavoriteCharacterErrorState;
}

@injectable
class FavoriteCharacterBloc extends Bloc<FavoriteCharacterEvent, FavoriteCharacterState> {
  FavoriteCharacterBloc(this._favoriteCharacterService) : super(const FavoriteCharacterUninitializedState()) {
    on<FavoriteCharacterEvent>(_onFavoriteCharacterEvent);
  }

  final FavoriteCharacterService _favoriteCharacterService;

  void _onFavoriteCharacterEvent(FavoriteCharacterEvent event, Emitter<FavoriteCharacterState> emitter) async {
    try {
      await event.when(
        favoriteCharacter: (character) async {
          emitter(const FavoriteCharacterLoadingState());
          final characterId = character.id;
          if (characterId == null) {
            emitter(const FavoriteCharacterErrorState(message: 'El personaje no cuenta con un id válido'));
            return;
          }
          final savedFavorite = await _favoriteCharacterService.getByCharacterId(characterId: characterId);
          var id = 0;
          if (savedFavorite != null) {
            id = await _favoriteCharacterService.changeFavorite(id: savedFavorite.id, isFavorite: !(savedFavorite.isFavorite ?? false));
          } else {
            id = await _favoriteCharacterService.insert(
              characterId: characterId,
              characterName: character.name ?? '',
              characterImage: character.image ?? '',
            );
          }
          emitter(FavoriteCharacterSuccessState(id: id));
        },
      );
    } on DioException catch (e) {
      var data = e.response?.data is Map ? e.response?.data as Map : null;
      var message = data?['detail'] as String?;
      message ??= e.response?.data is String? ? (e.response?.data as String?) : null;
      message ??= e.response?.statusMessage ?? '';
      emitter(FavoriteCharacterErrorState(message: message));
    } catch (e) {
      // Or else display any exception as error
      emitter(FavoriteCharacterErrorState(message: e.toString()));
    }
  }
}
