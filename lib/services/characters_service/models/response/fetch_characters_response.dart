class FetchCharactersResponse {
  final List<CharacterResult> results;

  FetchCharactersResponse({
    this.results = const [],
  });

  factory FetchCharactersResponse.fromJson(Map<String, dynamic> json) => FetchCharactersResponse(
    results: json['results'] == null ? [] : List<CharacterResult>.from((json['results'] as List).map((x) => CharacterResult.fromJson(x))),
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