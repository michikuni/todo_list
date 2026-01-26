import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';

class CircleCheck extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CircleCheck({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: value ? AppColors.mediumSlateBlue : AppColors.pureWhite,
            width: 2,
          ),
        ),
        child: value
            ? Center(
                child: Container(
                  width: 8,
                  height: 8,
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