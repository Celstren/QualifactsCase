import 'package:flutter/material.dart';
import 'package:qualifacts_case/ui/app_text_field/app_debounced_text_field.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';
import 'package:qualifacts_case/views/home_screen/logic_holders/cubit/filter_characters_cubit/filter_characters_cubit.dart';

class SearchCharacter extends StatelessWidget {
  final FilterCharactersCubit filterCharactersCubit;
  const SearchCharacter({super.key, required this.filterCharactersCubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: AppDebouncedTextField(
        hint: 'Dime su nombre',
        controller: TextEditingController(),
        fontColor: ColorsConstant.mantis,
        debounceTime: 1500,
        onSubmitted: (query) {
          filterCharactersCubit.change(name: query, page: 1);
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onDebounceChanged: (query) {
          filterCharactersCubit.change(name: query, page: 1);
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
