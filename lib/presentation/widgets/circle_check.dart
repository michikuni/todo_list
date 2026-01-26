import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';

class CircleCheck extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CircleCheck({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: AppSizes.taskTitleCircleCheckSize,
        height: AppSizes.taskTitleCircleCheckSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: value ? AppColors.mediumSlateBlue : AppColors.pureWhite,
            width: AppSizes.taskTitleCircleCheckBorderWidth,
          ),
        ),
        child: value
            ? Center(
                child: Container(
                  width: AppSizes.taskTitleCenterCircleCheckSize,
                  height: AppSizes.taskTitleCenterCircleCheckSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mediumSlateBlue,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}