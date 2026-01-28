import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/core/constants/signup_text.dart';
import 'package:todo_list/presentation/bloc/signup/signup_bloc.dart';
import 'package:todo_list/presentation/bloc/signup/signup_event.dart';
import 'package:todo_list/presentation/bloc/signup/signup_state.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';
import 'package:todo_list/presentation/widgets/text_input.dart';

class SignupPageWidget extends StatefulWidget {
  const SignupPageWidget({super.key});

  @override
  State<SignupPageWidget> createState() => _SignupPageWidgetState();
}

class _SignupPageWidgetState extends State<SignupPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.pureWhite,
          ),
        ),
      ),
      body: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.authPageHorizontalPadding,
                0,
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
                        SignupText.header,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(color: AppColors.pureWhite87),
                      ),
                    ),
                    SizedBox(height: AppSizes.padding24),
                    TextInputWidget(
                      isObscure: false,
                      hint: SignupText.usernameHint,
                      title: SignupText.usernameTitle,
                      onValueChanged: (value) {
                        context.read<SignupBloc>().add(
                          OnUsernameChanged(userName: value),
                        );
                      },
                    ),
                    SizedBox(height: AppSizes.padding24),
                    TextInputWidget(
                      isObscure: true,
                      hint: SignupText.passwordHint,
                      title: SignupText.passwordTitle,
                      onValueChanged: (value) {
                        context.read<SignupBloc>().add(
                          OnPasswordChanged(password: value),
                        );
                      },
                    ),
                    SizedBox(height: AppSizes.padding24),
                    TextInputWidget(
                      isObscure: true,
                      onValueChanged: (value) {
                        context.read<SignupBloc>().add(
                          OnConfirmPasswordChanged(confirmPassword: value),
                        );
                      },
                      hint: SignupText.passwordHint,
                      title: SignupText.confirmPasswordTitle,
                    ),
                    SizedBox(height: AppSizes.padding68),
                    PrimaryButtonWidget(
                      onPressed: () {
                        // print(state.username);
                        // print(state.password);
                        context.read<SignupBloc>().add(SignupSubmitEvent());
                        context.go('/sign-in');
                      },
                      height: AppSizes.authPrimaryButtonHeight,
                      text: SignupText.header,
                      width: double.infinity,
                    ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          SignupText.bottomText,
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(color: AppColors.pureWhite50),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Text(
                            SignupText.bottomTextButton,
                            style: Theme.of(context).textTheme.displaySmall
                                ?.copyWith(color: AppColors.pureWhite87),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.authPageBottomPadding),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
