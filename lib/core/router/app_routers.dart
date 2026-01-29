import 'package:go_router/go_router.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';
import 'package:todo_list/presentation/gate/auth_gate.dart';
import 'package:todo_list/presentation/pages/task/task.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter appRouters = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const AuthGate()),
      GoRoute(path: '/task', builder: (context, state) {
        final TodoWithKeyEntity todo = state.extra as TodoWithKeyEntity;
        return TaskPageWidget(todo: todo,);}),
    ],
  );
}
