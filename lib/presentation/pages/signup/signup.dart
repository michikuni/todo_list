import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/l10n/app_localizations.dart';
import 'package:todo_list/presentation/bloc/signup/signup_bloc.dart';
import 'package:todo_list/presentation/bloc/signup/signup_event.dart';
import 'package:todo_list/presentation/bloc/signup/signup_state.dart';
import 'package:todo_list/presentation/pages/signup/dialogs/fail_dialog.dart';
import 'package:todo_list/presentation/pages/signup/dialogs/success_dialog.dart';
import 'package:todo_list/presentation/widgets/loading_dialog.dart';
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
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.primaryFixedDim,
          ),
        ),
      ),
      body: BlocListener<SignupBloc, SignupState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            showDialog(
              context: context,
              builder: (context) => const SignupSuccessDialog(),
            );
          }
          if (state.status == FormzSubmissionStatus.failure) {
            showDialog(
              context: context,
              builder: (context) => const SignupFailDialog(),
            );
          }
          if (state.status == FormzSubmissionStatus.inProgress) {
            showDialog(
              context: context,
              builder: (context) => const LoadingDialog(),
            );
          }
        },
        child: BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) => SafeArea(
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
                        AppLocalizations.of(context)!.signupHeader,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                    SizedBox(height: AppSizes.authTextFieldSpace),
                    TextInputWidget(
                      isObscure: false,
                      hint: AppLocalizations.of(context)!.signupUsernameHint,
                      title: AppLocalizations.of(context)!.signupUsernameTitle,
                      onValueChanged: (value) {
                        context.read<SignupBloc>().add(
                          OnUsernameChanged(userName: value),
                        );
                      },
                    ),
                    if (state.username.isNotValid && !state.username.isPure)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            SizedBox(height: AppSizes.signupPageFailSpaceTop),
                            Text(
                              AppLocalizations.of(context)!.signupEmailFail,
                              style: Theme.of(context).textTheme.displaySmall
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: AppSizes.authTextFieldSpace),
                    TextInputWidget(
                      isObscure: true,
                      hint: AppLocalizations.of(context)!.signupPasswordHint,
                      title: AppLocalizations.of(context)!.signupPasswordTitle,
                      onValueChanged: (value) {
                        context.read<SignupBloc>().add(
                          OnPasswordChanged(password: value),
                        );
                      },
                    ),
                    if (state.password.isNotValid && !state.password.isPure)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            SizedBox(height: AppSizes.signupPageFailSpaceTop),
                            Text(
                              AppLocalizations.of(context)!.signupPasswordFail,
                              style: Theme.of(context).textTheme.displaySmall
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: AppSizes.authTextFieldSpace),
                    TextInputWidget(
                      isObscure: true,
                      onValueChanged: (value) {
                        context.read<SignupBloc>().add(
                          OnConfirmPasswordChanged(confirmPassword: value),
                        );
                      },
                      hint: AppLocalizations.of(context)!.signupPasswordHint,
                      title: AppLocalizations.of(context)!.signupConfirmPasswordTitle,
                    ),
                    if (state.confirmPassword.isNotValid &&
                        !state.confirmPassword.isPure)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            SizedBox(height: AppSizes.signupPageFailSpaceTop),
                            Text(
                              AppLocalizations.of(context)!.signupConfirmPasswordFail,
                              style: Theme.of(context).textTheme.displaySmall
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: AppSizes.authButtonSpaceTop),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButtonWidget(
                            isValid:
                                (state.username.isValid &&
                                (state.password.isValid &&
                                state.confirmPassword.isValid)),
                            onPressed: () {
                              context.read<SignupBloc>().add(SignupSubmitEvent());
                            },
                            height: AppSizes.authPrimaryButtonHeight,
                            text: AppLocalizations.of(context)!.signupHeader,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.signupBottomText,
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(color: Theme.of(context).colorScheme.onPrimaryFixedVariant),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.signupBottomTextButton,
                            style: Theme.of(context).textTheme.displaySmall
                                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.authPageBottomPadding),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
