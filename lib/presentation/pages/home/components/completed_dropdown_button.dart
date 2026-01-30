import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';

class CompletedDropdown extends StatefulWidget {

  const CompletedDropdown({
    super.key,
  });

  @override
  State<CompletedDropdown> createState() => _CompletedDropdownState();
}

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
        color: AppColors.pureWhite21,
        borderRadius: BorderRadius.circular(AppSizes.dropdownButtonRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: 'completed',
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
            DropdownMenuItem(value: 'completed', child: Text('Completed')),
          ],
          onChanged: (v) {
            if (v == null) return;
          },
        ),
      ),
    );
  }
}
