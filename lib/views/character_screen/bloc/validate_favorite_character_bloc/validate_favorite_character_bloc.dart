import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:qualifacts_case/services/storage_service/implementations/favorite_character_service.dart';

part 'validate_favorite_character_bloc.freezed.dart';

@freezed
class ValidateFavoriteCharacterEvent with _$ValidateFavoriteCharacterEvent {
  const factory ValidateFavoriteCharacterEvent.validateFavoriteCharacter({ required int characterId }) = ValidateFavoriteCharacter;
}

@freezed
class ValidateFavoriteCharacterState with _$ValidateFavoriteCharacterState {
  const factory ValidateFavoriteCharacterState.validateFavoriteCharacterUninitializedState() = ValidateFavoriteCharacterUninitializedState;
  const factory ValidateFavoriteCharacterState.validateFavoriteCharacterLoadingState() = ValidateFavoriteCharacterLoadingState;
  const factory ValidateFavoriteCharacterState.validateFavoriteCharacterSuccessState({ required bool isFavorite }) = ValidateFavoriteCharacterSuccessState;
  const factory ValidateFavoriteCharacterState.validateFavoriteCharacterErrorState({@Default('') String message}) = ValidateFavoriteCharacterErrorState;
  const factory ValidateFavoriteCharacterState.validateFavoriteCharacterConnectionErrorState() = ValidateFavoriteCharacterConnectionErrorState;
  const factory ValidateFavoriteCharacterState.validateFavoriteCharacterUnauthorizedState() = ValidateFavoriteCharacterUnauthorizedState;
}

@injectable
class ValidateFavoriteCharacterBloc extends Bloc<ValidateFavoriteCharacterEvent, ValidateFavoriteCharacterState> {
  ValidateFavoriteCharacterBloc(this._favoriteCharacterService) : super(const ValidateFavoriteCharacterUninitializedState()) {
    on<ValidateFavoriteCharacterEvent>(_onValidateFavoriteCharacterEvent);
  }

  final FavoriteCharacterService _favoriteCharacterService;

  void _onValidateFavoriteCharacterEvent(ValidateFavoriteCharacterEvent event, Emitter<ValidateFavoriteCharacterState> emitter) async {
    try {
      await event.when(
        validateFavoriteCharacter: (characterId) async {
          emitter(const ValidateFavoriteCharacterLoadingState());
          final savedFavorite = await _favoriteCharacterService.getByCharacterId(characterId: characterId);
          emitter(ValidateFavoriteCharacterSuccessState(isFavorite: savedFavorite?.isFavorite ?? false));
        },
      );
    } catch (e) {
      // Or else display any exception as error
      emitter(ValidateFavoriteCharacterErrorState(message: e.toString()));
    }
  }
}
