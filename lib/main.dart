import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list/core/di/injection.dart';
import 'package:todo_list/core/router/app_routers.dart';
import 'package:todo_list/core/theme/app_themes.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';
import 'package:todo_list/data/models/todo/todo_model.dart';
import 'package:todo_list/domain/usecases/profile/profile.dart';
import 'package:todo_list/l10n/app_localizations.dart';
import 'package:todo_list/presentation/bloc/gate/auth_bloc.dart';
import 'package:todo_list/presentation/bloc/gate/auth_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todos');
  configureDependencies();
  runApp(
    BlocProvider(
      create: (_) => AuthBloc(
        getProfile: getIt<GetProfileUseCase>(),
        storage: getIt<TokenStorage>(),
      )..add(AuthCheckEvent()),
      child: const TodoAppWidget(),
    ),
  );
}

class TodoAppWidget extends StatelessWidget {
  const TodoAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
      routerConfig: AppRouter.appRouters,
      supportedLocales: const [Locale('en')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
