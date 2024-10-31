enum CharacterSpecies { human, alien, empty }
enum CharacterStatus { alive, unknown, dead, empty }
enum CharacterGender { male, female, unknown, empty }

extension CharacterSpeciesExtension on CharacterSpecies {
  String get filter {
    switch (this) {
      case CharacterSpecies.alien: return 'alien';
      case CharacterSpecies.human: return 'human';
      case CharacterSpecies.empty: return '';
    }
  }
}

extension CharacterStatusExtension on CharacterStatus {
  String get filter {
    switch (this) {
      case CharacterStatus.alive: return 'alive';
      case CharacterStatus.dead: return 'dead';
      case CharacterStatus.empty: return '';
      case CharacterStatus.unknown: return 'unknown';
    }
  }
}

extension CharacterGenderExtension on CharacterGender {
  String get filter {
    switch (this) {
      case CharacterGender.female: return 'female';
      case CharacterGender.male: return 'male';
      case CharacterGender.empty: return 'genderless';
      case CharacterGender.unknown: return 'unknown';
    }
  }
}