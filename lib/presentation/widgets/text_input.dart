import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_sizes.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    super.key,
    required this.isObscure,
    required this.hint,
    required this.title,
    required this.onValueChanged,
    this.errorMessage,
  });
  final ValueChanged onValueChanged;
  final String title;
  final String hint;
  final bool isObscure;
  final String? errorMessage;

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
            ).textTheme.displayLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        SizedBox(height: AppSizes.textInputTitleSpaceBottom),
        Container(
          height: AppSizes.authTextFieldHeight,
          decoration: BoxDecoration(
            border: Border.all(
              width: AppSizes.authTextFieldBorder,
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: BorderRadius.circular(
              AppSizes.authTextFieldBorderRadius,
            ),
          ),
          padding: EdgeInsets.all(AppSizes.textInputPadding),
          child: TextFormField(
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(color: Theme.of(context).colorScheme.primaryFixedDim),
            obscureText: isObscure,
            decoration: InputDecoration(
              hint: Text(
                hint,
                style: Theme.of(
                  context,
                ).textTheme.displayLarge?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              border: InputBorder.none,
            ),
            onChanged: onValueChanged,
          ),
        ),
      ],
    );
  }
}
