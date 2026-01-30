import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/core/constants/signin_text.dart';
import 'package:todo_list/presentation/bloc/gate/auth_bloc.dart';
import 'package:todo_list/presentation/bloc/gate/auth_event.dart';
import 'package:todo_list/presentation/bloc/signin/signin_bloc.dart';
import 'package:todo_list/presentation/bloc/signin/signin_event.dart';
import 'package:todo_list/presentation/bloc/signin/signin_state.dart';
import 'package:todo_list/presentation/pages/signin/dialogs/fail_dialog.dart';
import 'package:todo_list/presentation/widgets/loading_dialog.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';
import 'package:todo_list/presentation/widgets/text_input.dart';

class SigninPageWidget extends StatelessWidget {
  const SigninPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: BlocListener<SigninBloc, SigninState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            Navigator.of(context, rootNavigator: true).pop();
            context.read<AuthBloc>().add(AuthCheckEvent());
          }
          if(state.status == FormzSubmissionStatus.inProgress){
            showDialog(context: context, builder: (context) => LoadingDialog(),);
          }
          if (state.status == FormzSubmissionStatus.failure) {
            Navigator.of(context, rootNavigator: true).pop();
            showDialog(context: context, builder: (context) => LoginFailDialog(),);
          }
        },
        child: BlocBuilder<SigninBloc, SigninState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
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
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(color: AppColors.pureWhite87),
                        ),
                      ),
                      SizedBox(height: AppSizes.authTextFieldSpace),
                      TextInputWidget(
                        hint: SigninText.usernameHint,
                        title: SigninText.usernameTitle,
                        onValueChanged: (value) {
                          context.read<SigninBloc>().add(
                            OnUsernameChanged(value),
                          );
                        },
                        isObscure: false,
                      ),
                      if(state.username.isNotValid && !state.username.isPure)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              SizedBox(height: 8,),
                              Text('Email invalid!', style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.mediumSlateBlue50),)
                            ],
                          ),
                        ),
                      SizedBox(height: AppSizes.authTextFieldSpace),
                      TextInputWidget(
                        isObscure: true,
                        onValueChanged: (value) {
                          context.read<SigninBloc>().add(
                            OnPasswordChanged(value),
                          );
                        },
                        hint: SigninText.passwordHint,
                        title: SigninText.passwordTitle,
                      ),
                      if(state.password.isNotValid && !state.password.isPure)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              SizedBox(height: 8,),
                              Text('Password invalid!', style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.mediumSlateBlue50),)
                            ],
                          ),
                        ),
                      SizedBox(height: AppSizes.authButtonSpaceTop),
                      PrimaryButtonWidget(
                        onPressed: () {
                          context.read<SigninBloc>().add(SigninSubmitEvent());
                        },
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
                            style: Theme.of(context).textTheme.displaySmall
                                ?.copyWith(color: AppColors.pureWhite50),
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
      ),
    );
  }
}
