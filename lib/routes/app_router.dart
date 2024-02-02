import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_p1/di/service.dart';
import 'package:todo_p1/features/todo/presentation/controller/todo_controller.dart';
import 'package:todo_p1/features/todo/presentation/ui/add_todo.dart';
import 'package:todo_p1/features/todo/presentation/ui/home.dart';
import 'package:todo_p1/routes/router_utils.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Pages.home.screenPath,
        name: Pages.home.screenName,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => service<TodoController>()..init(),
          child: const Home(),
        ),
        routes: [
          GoRoute(
            path: Pages.addTodo.screenPath,
            name: Pages.addTodo.screenName,
            builder: (context, state) => ChangeNotifierProvider.value(
              value: service<TodoController>(),
              child: AddTodo(),
            ),
          )
        ],
      )
    ],
  );
}
