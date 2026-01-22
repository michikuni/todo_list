import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required this.height,
    required this.text,
    required this.width,
  });
  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            width: AppSizes.authTextFieldBorder,
            color: AppColors.mediumSlateBlue50,
          ),
          borderRadius: BorderRadius.circular(
            AppSizes.authTextFieldBorderRadius,
          ),
          color: AppColors.mediumSlateBlue,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(color: AppColors.pureWhite),
          ),
        ),
      ),
    );
  }
}
