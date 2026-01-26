import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/di/injection.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';
import 'package:todo_list/domain/usecases/auth/auth.dart';
import 'package:todo_list/domain/usecases/profile/profile.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/signin/signin_bloc.dart';
import 'package:todo_list/presentation/bloc/signup/signup_bloc.dart';
import 'package:todo_list/presentation/pages/home/home.dart';
import 'package:todo_list/presentation/pages/signin/signin.dart';
import 'package:todo_list/presentation/pages/signup/signup.dart';
import 'package:todo_list/presentation/pages/task/task.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter appRouters = GoRouter(
    initialLocation: '/task',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (_) => SigninBloc(signin: getIt<SigninUseCase>()),
          child: const SigninPageWidget(),
        ),
      ),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => BlocProvider(
          create: (_) => SignupBloc(signup: getIt<SignupUseCase>()),
          child: const SignupPageWidget(),
        ),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => BlocProvider(
          create: (_) => HomeBloc(
            getProfile: getIt<GetProfileUseCase>(),
            tokenStorage: getIt<TokenStorage>(),
          )..add(GetProfileEvent()),
          child: const HomePageWidget(),
        ),
      ),
      GoRoute(
        path: '/task',
        builder: (context, state) => const TaskPageWidget(),
      ),
    ],
  );
}
