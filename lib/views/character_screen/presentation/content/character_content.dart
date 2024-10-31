import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qualifacts_case/services/characters_service/models/response/fetch_characters_response.dart';
import 'package:qualifacts_case/ui/app_image/app_image.dart';
import 'package:qualifacts_case/ui/app_text/app_text.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';

class CharacterContent extends StatefulWidget {
  final CharacterResult character;
  const CharacterContent({super.key, required this.character});

  @override
  State<CharacterContent> createState() => _CharacterContentState();
}

class _CharacterContentState extends State<CharacterContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 320,
          child: Stack(
            children: <Widget>[
              Hero(
                tag: widget.character.id!,
                child: AppImage.network(
                  width: MediaQuery.of(context).size.width,
                  height: 320,
                  asset: widget.character.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: AutoRouter.of(context).maybePop,
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: ColorsConstant.black.withOpacity(.4),
                                width: 3,
                              ),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.chevron_left,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppText.medium(
                widget.character.name ?? '',
                fontColor: ColorsConstant.mantis,
                fontSize: 24,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 12),
              AppText.normal(
                widget.character.status ?? '',
                fontColor: ColorsConstant.mantis,
                fontSize: 16,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 12),
              AppText.normal(
                widget.character.species ?? '',
                fontColor: ColorsConstant.mantis,
                fontSize: 16,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
