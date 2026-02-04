import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';

class LanguageDropdown extends StatefulWidget {
  final ValueChanged<LanguageDropdownValue> onChanged;

  const LanguageDropdown({
    super.key,
    required this.onChanged,
  });

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

enum LanguageDropdownValue { english, vietnamese }

class _LanguageDropdownState extends State<LanguageDropdown> {
  late LanguageDropdownValue initLanguage;
  @override
  void initState() {
    super.initState();
    initLanguage = LanguageDropdownValue.english;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: AppSizes.dropdownButtonHeight,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.dropdownButtonPaddingHorizontal,
      ),
      decoration: BoxDecoration(
        color: AppColors.pureWhite21,
        borderRadius: BorderRadius.circular(AppSizes.dropdownButtonRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<LanguageDropdownValue>(
          value: initLanguage,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: AppSizes.dropdownButtonIconSize,
            color: AppColors.pureWhite87,
          ),
          dropdownColor: AppColors.lightGrey,
          isExpanded: true,
          style: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(color: AppColors.pureWhite87),
          items: [
            DropdownMenuItem(
              value: LanguageDropdownValue.english,
              child: Text('English'),
            ),
            DropdownMenuItem(
              value: LanguageDropdownValue.vietnamese,
              child: Text('Vietnamese'),
            ),
          ],
          onChanged: (v) {
            print(v);
            if (v == null) return;
            setState(() => initLanguage = v);
            widget.onChanged(v);
          },
        ),
      ),
    );
  }
}
