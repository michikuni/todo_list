import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/core/di/injection.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';
import 'package:todo_list/domain/usecases/profile/get_profile.dart';
import 'package:todo_list/domain/usecases/profile/update_name_profile.dart';
import 'package:todo_list/domain/usecases/todo/todo.dart';
import 'package:todo_list/l10n/app_localizations.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/pages/home/components/bottom_nav_item.dart';
import 'package:todo_list/presentation/pages/home/dialogs/add_task_dialog.dart';
import 'package:todo_list/presentation/pages/home/home.dart';
import 'package:todo_list/presentation/pages/personal/personal.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOption = [
    HomePageWidget(),
    PersonalWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(
        getProfile: getIt<GetProfileUseCase>(),
        tokenStorage: getIt<TokenStorage>(),
        getTodo: getIt<GetTodoUseCase>(),
        addTodo: getIt<AddTodoUseCase>(),
        deleteTodo: getIt<DeleteTodoUseCase>(),
        updateTodo: getIt<UpdateTodoUseCase>(),
        updateNameProfile: getIt<UpdateNameProfileUseCase>()
      )..add(GetProfileEvent()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: (_selectedIndex == 0)
                ? SizedBox(
                    height: AppSizes.homeAddButtonSize,
                    width: AppSizes.homeAddButtonSize,
                    child: FloatingActionButton(
                      onPressed: () {
                        final homeBloc = context.read<HomeBloc>();
                        homeBloc.add(ResetAddTodoEvent());
                        showDialog(
                          context: context,
                          builder: (context) {
                            return BlocProvider.value(
                              value: homeBloc,
                              child: AddTaskDialog(),
                            );
                          },
                        );
                      },
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: const CircleBorder(),
                      child: Icon(
                        Icons.add,
                        size: AppSizes.homeAddButtonIconSize,
                        color: Theme.of(context).colorScheme.primaryFixedDim,
                      ),
                    ),
                  )
                : null,
            floatingActionButtonLocation: (_selectedIndex == 0)
                ? FloatingActionButtonLocation.centerDocked
                : null,
            bottomNavigationBar: BottomAppBar(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              child: SizedBox(
                height: AppSizes.homeBottomNavHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _onItemTapped(0);
                          });
                        },
                        child: BottomNavItem(
                          icon: Icons.home_filled,
                          label: AppLocalizations.of(
                            context,
                          )!.bottomBarIndexLabel,
                        ),
                      ),
                    ),
                    Expanded(
                      child: BottomNavItem(
                        icon: Icons.calendar_month_outlined,
                        label: AppLocalizations.of(
                          context,
                        )!.bottomBarCalendarLabel,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: BottomNavItem(
                        icon: Icons.access_time,
                        label: AppLocalizations.of(
                          context,
                        )!.bottomBarFocusLabel,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _onItemTapped(1);
                          });
                        },
                        child: BottomNavItem(
                          icon: Icons.person_outline_rounded,
                          label: AppLocalizations.of(
                            context,
                          )!.bottomBarProfileLabel,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: _widgetOption.elementAt(_selectedIndex),
          );
        },
      ),
    );
  }
}
