import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/l10n/app_localizations.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class LoginFailDialog extends StatelessWidget {
  const LoginFailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.signinDialogRadius),
          color: AppColors.darkGrey,
        ),
        padding: EdgeInsets.all(AppSizes.signinDialogPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.signinDialogTitleText,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: AppColors.pureWhite87,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSizes.signinDialogDivideSpaceTop),
            Divider(height: 1),
            const SizedBox(height: AppSizes.signinDialogDivideSpaceBottom),
            Text(
              AppLocalizations.of(context)!.signinDialogContentText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.pureWhite87,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.signinDialogContentSpaceBottom),
            Row(
              children: [
                Expanded(
                  child: PrimaryButtonWidget(
                    isValid: true,
                    height: AppSizes.signinDialogButtonHeight,
                    text: AppLocalizations.of(context)!.signinDialogButtonText,
                    width: AppSizes.signinDialogButtonWidth,
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
