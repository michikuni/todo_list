import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({super.key, required this.hint, required this.title});
  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(color: AppColors.pureWhite87),
          ),
        ),
        SizedBox(height: AppSizes.padding8),
        Container(
          height: AppSizes.authTextFieldHeight,
          decoration: BoxDecoration(
            border: Border.all(
              width: AppSizes.authTextFieldBorder,
              color: AppColors.mediumGrey,
            ),
            borderRadius: BorderRadius.circular(
              AppSizes.authTextFieldBorderRadius,
            ),
          ),
          padding: EdgeInsets.all(AppSizes.padding12),
          child: TextFormField(
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(color: AppColors.pureWhite),
            obscureText: true,
            decoration: InputDecoration(
              hint: Text(
                hint,
                style: Theme.of(
                  context,
                ).textTheme.displayLarge?.copyWith(color: AppColors.lightGrey),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
