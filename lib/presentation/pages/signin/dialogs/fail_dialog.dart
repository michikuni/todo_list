import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class LoginFailDialog extends StatelessWidget {
  const LoginFailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.darkGrey,
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login Fail',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: AppColors.pureWhite87,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Divider(height: 1),
            const SizedBox(height: 24),
            Text(
              'Incorrect account or password',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.pureWhite87,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: PrimaryButtonWidget(
                    isValid: true,
                    height: 48,
                    text: 'OK!',
                    width: 140,
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
