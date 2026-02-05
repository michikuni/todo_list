import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/di/injection.dart';
import 'package:todo_list/domain/usecases/auth/auth.dart';
import 'package:todo_list/presentation/bloc/gate/auth_bloc.dart';
import 'package:todo_list/presentation/bloc/gate/auth_state.dart';
import 'package:todo_list/presentation/bloc/signin/signin_bloc.dart';
import 'package:todo_list/presentation/pages/main/main_layout.dart';
import 'package:todo_list/presentation/pages/signin/signin.dart';
import 'package:todo_list/presentation/widgets/loading_dialog.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        switch (state) {
          case AuthLoading():
          case AuthInitial():
            return LoadingDialog();

          case AuthAuthenticated():
            return MainLayout();

          case AuthUnauthenticated():
            return BlocProvider(
              create: (_) => SigninBloc(signin: getIt<SigninUseCase>()),
              child: const SigninPageWidget(),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
