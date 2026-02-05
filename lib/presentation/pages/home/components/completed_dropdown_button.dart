import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/l10n/app_localizations.dart';

class CompletedDropdown extends StatefulWidget {
  final Color textColor;
  const CompletedDropdown({
    super.key,
    required this.textColor
  });

  @override
  State<CompletedDropdown> createState() => _CompletedDropdownState();
}

enum CompletedDropdownValue {completed}

class _CompletedDropdownState extends State<CompletedDropdown> {

  @override
  Widget build(BuildContext context) {
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
        child: DropdownButton<CompletedDropdownValue>(
          value: CompletedDropdownValue.completed,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: AppSizes.dropdownButtonIconSize,
            color: widget.textColor,
          ),
          dropdownColor: Theme.of(context).colorScheme.onSecondaryContainer,
          isExpanded: true,
          style: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(color: widget.textColor),
          items: [
            DropdownMenuItem(value: CompletedDropdownValue.completed, child: Text(AppLocalizations.of(context)!.dropDownCompleted)),
          ],
          onChanged: (v) {
            if (v == null) return;
          },
        ),
      ),
    );
  }
}
