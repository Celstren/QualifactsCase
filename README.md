
# RikiWiki

This project was developed to accomplish the technical case presented by Qualifacts for Flutter Development




## 🚀 About Me
Hi! I'm Gustavo Carrillo a Software Developer specialized in the Mobile Application Development with Flutter. I have a big passion for software development. I like contributing with ideas to bring solutions for everyday needs. In this project I present a solution for the technical case presented by Qualifacts so let's get started!


## Run Locally

Clone the project

```bash
  git clone https://github.com/Celstren/QualifactsCase.git
```

Go to the project directory

```bash
  cd QualifactsCase
```

Install dependencies

```bash
  flutter pub get
```

Generate required code

```bash
  dart run build_runner build --delete-conflicting-outputs
```

Or keep generating code while working on the project

```bash
  dart run build_runner watch --delete-conflicting-outputs
```

Run the project

```bash
  flutter run
```

Remember to check your Flutter SDK status with

```bash
  flutter doctor
```
## Running Tests

To run tests, run the following command

```bash
  flutter run -t test/unit_test/character_test/character_test.dart
  flutter run -t test/functional_test/favorite_character_test/favorite_character_test.dart
  flutter run -t test/functional_test/fetch_characters_test/fetch_characters_test.dart
```

