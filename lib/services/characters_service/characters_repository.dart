import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:qualifacts_case/networking/app_api_exception.dart';
import 'package:qualifacts_case/networking/dio_client.dart';
import 'package:qualifacts_case/services/characters_service/models/enum/characters_enum.dart';
import 'package:qualifacts_case/services/characters_service/models/request/fetch_characters_request.dart';
import 'package:qualifacts_case/services/characters_service/models/response/fetch_characters_response.dart';

@LazySingleton(as: ICharacterRepository)
class CharacterRepository implements ICharacterRepository {
  final DioClient _dioClient;

  CharacterRepository(this._dioClient);

  @override
  Future<FetchCharactersResponse> fetchCharacters({ required FetchCharactersRequest request }) async {
    final response = await _dioClient.get(
      'https://rickandmortyapi.com/api/character/',
      queryParams: {
        'page': '${request.page}',
        if (request.name != null) 'name': request.name!,
        if (request.status != null) 'status': request.status!.filter,
        if (request.species != null) 'species': request.species!.filter,
        if (request.type != null) 'type': request.type!,
        if (request.gender != null) 'gender': request.gender!.filter,
      },
    );
    if (response.statusCode != HttpStatus.ok) {
      throw const AppApiException('There was a problem fetching athletes');
    }
    return FetchCharactersResponse.fromJson(response.data);
  }

  @override
  Future<CharacterResult> fetchCharacterById({ required int id }) async {
    final response = await _dioClient.get('https://rickandmortyapi.com/api/character/$id');
    if (response.statusCode != HttpStatus.ok) {
      throw const AppApiException('There was a problem fetching athletes');
    }
    return CharacterResult.fromJson(response.data);
  }
}

abstract class ICharacterRepository {
  Future<FetchCharactersResponse> fetchCharacters({ required FetchCharactersRequest request });
  Future<CharacterResult> fetchCharacterById({ required int id });
}