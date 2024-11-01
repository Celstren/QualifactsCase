import 'package:qualifacts_case/services/characters_service/models/enum/characters_enum.dart';

class FetchCharactersResponse {
  final List<CharacterResult> results;
  final PaginationInfo? info;

  FetchCharactersResponse({
    this.results = const [],
    this.info,
  });

  factory FetchCharactersResponse.fromJson(Map<String, dynamic> json) => FetchCharactersResponse(
    results: json['results'] == null ? [] : List<CharacterResult>.from((json['results'] as List).map((x) => CharacterResult.fromJson(x))),
    info: json['info'] == null ? null : PaginationInfo.fromJson(json['info']),
  );
}

class PaginationInfo {
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  PaginationInfo({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory PaginationInfo.fromJson(Map<String, dynamic> json) => PaginationInfo(
    count: json['count'],
    pages: json['pages'],
    next: json['next'],
    prev: json['prev'],
  );
}

class CharacterResult {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final CharacterLocation? origin;
  final CharacterLocation? location;
  final String? image;
  final String? url;
  final String? created;
  final String heroTag;

  CharacterResult({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.url,
    this.created,
    this.heroTag = '',
  });

  factory CharacterResult.fromJson(Map<String, dynamic> json) => CharacterResult(
    id: json['id'],
    name: json['name'],
    status: json['status'],
    species: json['species'],
    type: json['type'],
    gender: json['gender'],
    origin: json['origin'] == null ? null : CharacterLocation.fromJson(json['origin']),
    location: json['location'] == null ? null : CharacterLocation.fromJson(json['location']),
    image: json['image'],
    url: json['url'],
    created: json['created'],
    heroTag: '${json['id'] ?? 0}',
  );
}

class CharacterLocation {
  final String? name;
  final String? url;

  CharacterLocation({
    this.name,
    this.url,
  });

  factory CharacterLocation.fromJson(Map<String, dynamic> json) => CharacterLocation(
    name: json['name'],
    url: json['url'],
  );
}