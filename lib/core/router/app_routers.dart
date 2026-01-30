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
        builder: (context, state) {
          final TodoWithKeyEntity todo = state.extra as TodoWithKeyEntity;
          return BlocProvider(
            create: (context) => TaskBloc(
              update: getIt<UpdateTodoUseCase>(),
              delete: getIt<DeleteTodoUseCase>(),
            ),
            child: TaskPageWidget(todo: todo),
          );
        },
      ),
      GoRoute(
        path: AppRouterPath.signupRouter,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SignupBloc(signup: getIt<SignupUseCase>()),
            child: const SignupPageWidget(),
          );
        },
      ),
    ],
  );
}
