import 'package:go_router/go_router.dart';
import 'package:todo_list/presentation/gate/auth_gate.dart';
import 'package:todo_list/presentation/pages/task/task.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter appRouters = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (_, _) => const AuthGate()),
      GoRoute(path: '/task', builder: (_, _) => const TaskPageWidget()),
    ],
  );
}
