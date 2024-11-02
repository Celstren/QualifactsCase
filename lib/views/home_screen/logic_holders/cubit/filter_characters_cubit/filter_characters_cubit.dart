import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:qualifacts_case/services/characters_service/models/enum/characters_enum.dart';
import 'package:qualifacts_case/services/characters_service/models/request/fetch_characters_request.dart';

@injectable
class FilterCharactersCubit extends Cubit<FetchCharactersRequest> {
  FilterCharactersCubit() : super(FetchCharactersRequest(page: 1));

  void change({
    String? name,
    CharacterStatus? status,
    CharacterSpecies? species,
    String? type,
    CharacterGender? gender,
    int? page,
  }) =>
      emit(state.copyWith(
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        page: page,
      ));
}
