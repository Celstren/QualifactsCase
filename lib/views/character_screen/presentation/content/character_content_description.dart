import 'package:flutter/material.dart';
import 'package:qualifacts_case/services/characters_service/models/response/fetch_characters_response.dart';
import 'package:qualifacts_case/ui/app_text/app_text.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';

class CharacterContentDescription extends StatelessWidget {
  final String title;
  final CharacterLocation? characterLocation;
  const CharacterContentDescription.origin({super.key, this.title = 'Origen: ', required this.characterLocation});
  const CharacterContentDescription.location({super.key, this.title = 'Ubicación: ', required this.characterLocation});

  @override
  Widget build(BuildContext context) {
    if (characterLocation == null) return const SizedBox();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: ColorsConstant.moonstone,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Icon(Icons.location_on, color: Colors.red, size: 24),
          const SizedBox(width: 4),
          AppText.normal(
            title,
            fontColor: ColorsConstant.white,
            fontSize: 20,
            textAlign: TextAlign.start,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: AppText.normal(
              characterLocation?.name ?? '',
              fontColor: ColorsConstant.white,
              fontSize: 20,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
