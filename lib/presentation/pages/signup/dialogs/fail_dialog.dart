import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/l10n/app_localizations.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class SignupFailDialog extends StatelessWidget {
  const SignupFailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.signupDialogRadius),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        padding: EdgeInsets.all(AppSizes.signupDialogPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.signupDialogFailTitleText,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSizes.signupDialogDivideSpaceTop),
            Divider(height: 1),
            const SizedBox(height: AppSizes.signupDialogDivideSpaceBottom),
            Text(
              AppLocalizations.of(context)!.signupDialogFailContentText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.signupDialogContentSpaceBottom),
            Row(
              children: [
                Expanded(
                  child: PrimaryButtonWidget(
                    isValid: true,
                    height: AppSizes.signupDialogButtonHeight,
                    text: AppLocalizations.of(context)!.signupDialogButtonText,
                    width: AppSizes.signupDialogButtonWidth,
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
