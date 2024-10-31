import 'package:injectable/injectable.dart';
import 'package:qualifacts_case/services/characters_service/characters_repository.dart';
import 'package:qualifacts_case/services/characters_service/models/request/fetch_characters_request.dart';
import 'package:qualifacts_case/services/characters_service/models/response/fetch_characters_response.dart';

@injectable
class CharactersService {
  final ICharacterRepository _repository;

  CharactersService(this._repository);

  Future<FetchCharactersResponse> fetchCharacters({ required FetchCharactersRequest request }) => _repository.fetchCharacters(request: request);
  Future<CharacterResult> fetchCharacterById({ required int id }) => _repository.fetchCharacterById(id: id);
}