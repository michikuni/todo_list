import 'package:flutter/material.dart';
import 'package:todo_list/core/di/injection.dart';
import 'package:todo_list/core/router/app_routers.dart';
import 'package:todo_list/core/theme/app_themes.dart';

void main() {
  configureDependencies();
  runApp(const TodoAppWidget());
}

class TodoAppWidget extends StatelessWidget {
  const TodoAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
      routerConfig: AppRouter.appRouters,
    );
  }
}

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SignupBloc(createAuth: getIt<CreateAuthUseCase>()),
//       child: BlocBuilder<SignupBloc, SignupState>(
//         builder: (context, state) {
//           return SafeArea(
//           child: Center(
//             child: TextButton(onPressed: (){
//               context.read<SignupBloc>().add(SignupSubmitEvent(auth: AuthEntity(email: 'minhphuong1@gmail.com', password: '123123')));
//             }, child: Icon(Icons.add_circle, size: 50,)),
//           ),
//         );
//         },
//       ),
//     );
//   }
// }