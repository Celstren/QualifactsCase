import 'package:qualifacts_case/services/characters_service/models/enum/characters_enum.dart';

class FetchCharactersRequest {
  final String? name;
  final CharacterStatus? status;
  final CharacterSpecies? species;
  final String? type;
  final CharacterGender? gender;
  final int page;

  FetchCharactersRequest({
    this.name = '',
    this.status,
    this.species,
    this.type = '',
    this.gender,
    this.page = 0,
  });

  FetchCharactersRequest copyWith({
    String? name,
    CharacterStatus? status,
    CharacterSpecies? species,
    String? type,
    CharacterGender? gender,
    int? page,
  }) =>
      FetchCharactersRequest(
        name: name ?? this.name,
        status: status ?? this.status,
        species: species ?? this.species,
        type: type ?? this.type,
        gender: gender ?? this.gender,
        page: page ?? this.page,
      );

  @override
  bool operator ==(Object other) {
    return other is FetchCharactersRequest
        && other.name == name
        && other.status == status
        && other.species == species
        && other.type == type
        && other.gender == gender
        && other.page == page;
  }

  @override
  int get hashCode => runtimeType.hashCode;
}
