import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/core/constants/signin_text.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';
import 'package:todo_list/presentation/widgets/text_input.dart';

class SigninPageWidget extends StatelessWidget {
  const SigninPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSizes.authPageHorizontalPadding,
            AppSizes.signinPageTopPadding,
            AppSizes.authPageHorizontalPadding,
            0,
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    SigninText.header,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.pureWhite87,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.padding24),
                TextInputWidget(
                  hint: SigninText.usernameHint,
                  title: SigninText.usernameTitle,
                ),
                SizedBox(height: AppSizes.padding24),
                TextInputWidget(
                  hint: SigninText.passwordHint,
                  title: SigninText.passwordTitle,
                ),
                SizedBox(height: AppSizes.padding24),
                SizedBox(height: AppSizes.padding68),
                PrimaryButtonWidget(
                  height: AppSizes.authPrimaryButtonHeight,
                  text: SigninText.header,
                  width: double.infinity,
                ),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      SigninText.bottomText,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppColors.pureWhite50,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        context.push('/sign-up');
                      },
                      child: Text(
                        SigninText.bottomTextButton,
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: AppColors.pureWhite87,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.authPageBottomPadding,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
