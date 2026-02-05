import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/l10n/app_localizations.dart';

enum TimeFilter {
  today,
  week,
  month,
  all,
}

class FilterDropdown extends StatefulWidget {
  final TimeFilter initialValue;
  final ValueChanged<TimeFilter> onChanged;
  final Color textColor;

  const FilterDropdown({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.textColor
  });

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  late TimeFilter value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.dropdownButtonWidth,
      height: AppSizes.dropdownButtonHeight,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.dropdownButtonPaddingHorizontal,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(AppSizes.dropdownButtonRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<TimeFilter>(
          value: value,
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
            DropdownMenuItem(value: TimeFilter.today, child: Text(AppLocalizations.of(context)!.dropDownUncompletedToday)),
            DropdownMenuItem(value: TimeFilter.week, child: Text(AppLocalizations.of(context)!.dropDownUncompletedWeek)),
            DropdownMenuItem(value: TimeFilter.month, child: Text(AppLocalizations.of(context)!.dropDownUncompletedMonth)),
            DropdownMenuItem(value: TimeFilter.all, child: Text(AppLocalizations.of(context)!.dropDownUncompletedAll)),
          ],
          onChanged: (v) {
            if (v == null) return;
            setState(() => value = v);
            widget.onChanged(v);
          },
        ),
      ),
    );
  }
}
