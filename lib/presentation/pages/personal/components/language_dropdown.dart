import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/l10n/app_localizations.dart';

class LanguageDropdown extends StatefulWidget {
  final ValueChanged<LanguageDropdownValue> onChanged;
  final Locale locale;

  const LanguageDropdown({
    super.key,
    required this.onChanged,
    required this.locale
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
    if(widget.locale == Locale('vi')){
      initLanguage =LanguageDropdownValue.vietnamese;
    }
    if(widget.locale == Locale('en')){
      initLanguage =LanguageDropdownValue.english;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: 104,
      height: AppSizes.dropdownButtonHeight,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.dropdownButtonPaddingHorizontal,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(AppSizes.dropdownButtonRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<LanguageDropdownValue>(
          value: initLanguage,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: AppSizes.dropdownButtonIconSize,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          dropdownColor: Theme.of(context).colorScheme.onSecondaryContainer,
          isExpanded: true,
          style: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          items: [
            DropdownMenuItem(
              value: LanguageDropdownValue.english,
              child: Text(l10n.profileDropdownEn),
            ),
            DropdownMenuItem(
              value: LanguageDropdownValue.vietnamese,
              child: Text(l10n.profileDropdownVi),
            ),
          ],
          onChanged: (v) {
            if (v == null) return;
            widget.onChanged(v);
          },
        ),
      ),
    );
  }
}
