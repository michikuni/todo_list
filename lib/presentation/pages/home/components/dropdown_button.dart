import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';

class FilterDropdown extends StatefulWidget {
  const FilterDropdown({super.key});

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  String value = 'Today';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.pureWhite21,
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 16,
            color: AppColors.pureWhite87,
          ),
          dropdownColor: AppColors.lightGrey,
          isExpanded: true,
          style: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(color: AppColors.pureWhite87),
          items: const [
            DropdownMenuItem(value: 'Today', child: Text('Today')),
            DropdownMenuItem(value: 'Week', child: Text('Week')),
            DropdownMenuItem(value: 'Month', child: Text('Month')),
          ],
          onChanged: (v) {
            if (v != null) {
              setState(() => value = v);
            }
          },
        ),
      ),
    );
  }
}
