import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/core/constants/home_text.dart';
import 'package:todo_list/presentation/bloc/gate/auth_bloc.dart';
import 'package:todo_list/presentation/bloc/gate/auth_event.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';
import 'package:todo_list/presentation/pages/home/components/bottom_nav_item.dart';
import 'package:todo_list/presentation/pages/home/components/dropdown_button.dart';
import 'package:todo_list/presentation/pages/home/components/uncomplete_todo_item.dart';
import 'package:todo_list/presentation/pages/home/dialogs/add_task_dialog.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: SizedBox(
            height: 64,
            width: 64,
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
              backgroundColor: AppColors.mediumSlateBlue,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                size: 32,
                color: AppColors.pureWhite,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: AppColors.darkGrey,
            child: SizedBox(
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<AuthBloc>().add(AuthLoggedOut());
                    },
                    child: BottomNavItem(
                      icon: Icons.home_filled,
                      label: "Index",
                      marginLeft: 20,
                    ),
                  ),
                  BottomNavItem(
                    icon: Icons.calendar_month_outlined,
                    label: "Calendar",
                    marginLeft: 20,
                  ),
                  Spacer(),
                  BottomNavItem(
                    icon: Icons.access_time,
                    label: "Focus",
                    marginRight: 20,
                  ),
                  BottomNavItem(
                    icon: Icons.person_outline_rounded,
                    label: "Profile",
                    marginRight: 20,
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            actionsPadding: EdgeInsets.only(
              right: AppSizes.homePageHorizontalPadding,
            ),
            backgroundColor: AppColors.black,
            centerTitle: true,
            actions: [
              CircleAvatar(radius: 20, child: Icon(Icons.ac_unit_rounded)),
            ],
            title: Text(
              HomeText.appBarTitle,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.pureWhite87),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.homePageHorizontalPadding,
              ),
              child: Icon(
                Icons.filter_list_rounded,
                color: AppColors.pureWhite87,
              ),
            ),
          ),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.black,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (state.listTodo.isEmpty)
                    Expanded(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(HomeText.emptyImageAssets),
                            SizedBox(height: AppSizes.homePageEmptyContentTop),
                            Text(
                              HomeText.emptyContent,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.pureWhite87),
                            ),
                            SizedBox(
                              height: AppSizes.homePageEmptyInstructionTop,
                            ),
                            Text(
                              HomeText.emptyInstruction,
                              style: Theme.of(context).textTheme.displayLarge
                                  ?.copyWith(color: AppColors.pureWhite87),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (state.listTodo.isNotEmpty)
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: AppSizes.authTextFieldHeight,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: AppSizes.authTextFieldBorder,
                                color: AppColors.mediumGrey,
                              ),
                              borderRadius: BorderRadius.circular(
                                AppSizes.authTextFieldBorderRadius,
                              ),
                            ),
                            margin: EdgeInsets.only(top: 12, bottom: 20),
                            padding: EdgeInsets.all(AppSizes.padding12),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/icons/search.svg'),
                                SizedBox(width: AppSizes.padding12),
                                Expanded(
                                  child: TextFormField(
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(color: AppColors.pureWhite),
                                    decoration: InputDecoration(
                                      hint: Text(
                                        'Search for your task...',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.copyWith(
                                              color: AppColors.lightGrey,
                                            ),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FilterDropdown(),
                          ),
                          SizedBox(height: 16),
                          Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.only(bottom: 20),
                              separatorBuilder: (context, index) => SizedBox(height: 16,),
                              itemCount: state.listTodo.length,
                              itemBuilder: (context, index) {
                                return UncompletedTodoItem(
                                  content: state.listTodo[index].todo.content,
                                  category: state.listTodo[index].todo.category,
                                  description:
                                      state.listTodo[index].todo.minutes.toString(),
                                  priority: state.listTodo[index].todo.priority,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
