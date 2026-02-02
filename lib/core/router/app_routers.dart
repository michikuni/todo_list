import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_router_path.dart';
import 'package:todo_list/core/di/injection.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';
import 'package:todo_list/domain/usecases/auth/auth.dart';
import 'package:todo_list/domain/usecases/todo/todo.dart';
import 'package:todo_list/presentation/bloc/signup/signup_bloc.dart';
import 'package:todo_list/presentation/bloc/task/task_bloc.dart';
import 'package:todo_list/presentation/gate/auth_gate.dart';
import 'package:todo_list/presentation/pages/signup/signup.dart';
import 'package:todo_list/presentation/pages/task/task.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter appRouters = GoRouter(
    initialLocation: AppRouterPath.gateRouter,
    routes: [
      GoRoute(
        path: AppRouterPath.gateRouter,
        builder: (context, state) => const AuthGate(),
      ),
      GoRoute(
        path: AppRouterPath.taskRouter,
        pageBuilder: (context, state) {
          final todo = state.extra as TodoWithKeyEntity;
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: BlocProvider(
              create: (_) => TaskBloc(
                update: getIt<UpdateTodoUseCase>(),
                delete: getIt<DeleteTodoUseCase>(),
              ),
              child: TaskPageWidget(todo: todo),
            ),
          );
        },
      ),
      GoRoute(
        path: AppRouterPath.signupRouter,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => SignupBloc(signup: getIt<SignupUseCase>()),
            child: const SignupPageWidget(),
          ),
        ),
      ),
    ],
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
