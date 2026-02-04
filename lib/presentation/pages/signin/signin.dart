import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_router_path.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/l10n/app_localizations.dart';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: BlocListener<SigninBloc, SigninState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            Navigator.of(context, rootNavigator: true).pop();
            context.read<AuthBloc>().add(AuthCheckEvent());
          }
          if (state.status == FormzSubmissionStatus.inProgress) {
            showDialog(context: context, builder: (context) => LoadingDialog());
          }
          if (state.status == FormzSubmissionStatus.failure) {
            Navigator.of(context, rootNavigator: true).pop();
            showDialog(
              context: context,
              builder: (context) => LoginFailDialog(),
            );
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
                          AppLocalizations.of(context)!.signinHeader,
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(color: AppColors.pureWhite87),
                        ),
                      ),
                      SizedBox(height: AppSizes.authTextFieldSpace),
                      TextInputWidget(
                        hint: AppLocalizations.of(context)!.signinUsernameHint,
                        title: AppLocalizations.of(context)!.signinUsernameTitle,
                        onValueChanged: (value) {
                          context.read<SigninBloc>().add(
                            OnUsernameChanged(value),
                          );
                        },
                        isObscure: false,
                        // errorMessage: state.username.displayError,
                      ),
                      if (state.username.isNotValid && !state.username.isPure)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              SizedBox(height: AppSizes.signinPageFailSpaceTop),
                              Text(
                                AppLocalizations.of(context)!.signinEmailFail,
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(
                                      color: AppColors.mediumSlateBlue50,
                                    ),
                              ),
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
                        hint: AppLocalizations.of(context)!.signinPasswordHint,
                        title: AppLocalizations.of(context)!.signinPasswordTitle,
                      ),
                      if (state.password.isNotValid && !state.password.isPure)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              SizedBox(height: AppSizes.signinPageFailSpaceTop),
                              Text(
                                AppLocalizations.of(context)!.signinPasswordFail,
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(
                                      color: AppColors.mediumSlateBlue50,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(height: AppSizes.authButtonSpaceTop),
                      PrimaryButtonWidget(
                        isValid:
                            (state.username.isValid && state.password.isValid),
                        onPressed: () {
                          context.read<SigninBloc>().add(SigninSubmitEvent());
                        },
                        height: AppSizes.authPrimaryButtonHeight,
                        text: AppLocalizations.of(context)!.signinHeader,
                        width: double.infinity,
                      ),
                      Expanded(child: Container()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.signinBottomText,
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
                              context.push(AppRouterPath.signupRouter);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.signinBottomTextButton,
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
