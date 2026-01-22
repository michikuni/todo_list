import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/di/injection.dart';
import 'package:todo_list/domain/usecases/auth.dart';
import 'package:todo_list/presentation/bloc/signup/signup_bloc.dart';
import 'package:todo_list/presentation/pages/signin/signin.dart';
import 'package:todo_list/presentation/pages/signup/signup.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter appRouters = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SigninPageWidget()),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => BlocProvider(
          create: (_) => SignupBloc(createAuth: getIt<CreateAuthUseCase>()),
          child: const SignupPageWidget(),
        ),
      ),
    ],
  );
}
