import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_sizes.dart';

class CircleCheck extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double? padding;
  final Color radioColor;

  const CircleCheck({
    super.key,
    required this.value,
    required this.onChanged,
    this.padding,
    required this.radioColor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: EdgeInsets.all(padding ?? 0),
        child: Container(
          width: AppSizes.taskTitleCircleCheckSize,
          height: AppSizes.taskTitleCircleCheckSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: value
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primaryFixedDim,
              width: AppSizes.taskTitleCircleCheckBorderWidth,
            ),
          ),
          child: value
              ? Center(
                  child: Container(
                    width: AppSizes.taskTitleCenterCircleCheckSize,
                    height: AppSizes.taskTitleCenterCircleCheckSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: radioColor,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
