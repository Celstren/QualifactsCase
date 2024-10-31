import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CharacterListLoading extends StatefulWidget {
  const CharacterListLoading({super.key});

  @override
  State<CharacterListLoading> createState() => _CharacterListLoadingState();
}

class _CharacterListLoadingState extends State<CharacterListLoading> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animations/Morty_Loading.json',
      controller: _controller,
      fit: BoxFit.cover,
      onLoaded: (composition) {
        _controller
          ..duration = const Duration(milliseconds: 500)
          ..repeat();
      },
    );
  }
}
