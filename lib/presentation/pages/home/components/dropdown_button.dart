import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';

enum TimeFilter {
  today,
  week,
  month,
  all,
}

class FilterDropdown extends StatefulWidget {
  final TimeFilter initialValue;
  final ValueChanged<TimeFilter> onChanged;

  const FilterDropdown({
    super.key,
    required this.initialValue,
    required this.onChanged,
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
        color: AppColors.pureWhite21,
        borderRadius: BorderRadius.circular(AppSizes.dropdownButtonRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<TimeFilter>(
          value: value,
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
            DropdownMenuItem(value: TimeFilter.today, child: Text('Today')),
            DropdownMenuItem(value: TimeFilter.week, child: Text('Week')),
            DropdownMenuItem(value: TimeFilter.month, child: Text('Month')),
            DropdownMenuItem(value: TimeFilter.all, child: Text('All')),
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
