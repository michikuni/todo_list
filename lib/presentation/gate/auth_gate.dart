import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/di/injection.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';
import 'package:todo_list/domain/usecases/auth/auth.dart';
import 'package:todo_list/domain/usecases/profile/profile.dart';
import 'package:todo_list/domain/usecases/todo/todo.dart';
import 'package:todo_list/presentation/bloc/gate/auth_bloc.dart';
import 'package:todo_list/presentation/bloc/gate/auth_state.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/signin/signin_bloc.dart';
import 'package:todo_list/presentation/pages/home/home.dart';
import 'package:todo_list/presentation/pages/signin/signin.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        switch (state) {
          case AuthLoading():
          case AuthInitial():
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );

          case AuthAuthenticated():
            return BlocProvider(
              create: (_) => HomeBloc(
                getProfile: getIt<GetProfileUseCase>(),
                tokenStorage: getIt<TokenStorage>(),
                getTodo: getIt<GetTodoUseCase>(),
                addTodo: getIt<AddTodoUseCase>(),
                deleteTodo: getIt<DeleteTodoUseCase>(),
                updateTodo: getIt<UpdateTodoUseCase>(),
              )..add(GetTodoEvent()),
              child: const HomePageWidget(),
            );

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
