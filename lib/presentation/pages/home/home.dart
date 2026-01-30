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
import 'package:todo_list/presentation/pages/home/components/complete_todo_item.dart';
import 'package:todo_list/presentation/pages/home/components/completed_dropdown_button.dart';
import 'package:todo_list/presentation/pages/home/components/dropdown_button.dart';
import 'package:todo_list/presentation/pages/home/components/uncomplete_todo_item.dart';
import 'package:todo_list/presentation/pages/home/dialogs/add_task_dialog.dart';
import 'package:todo_list/presentation/pages/home/utils/filter_todo_function.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  TimeFilter selectedFilter = TimeFilter.all;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final filteredUncompletedTodos = filterTodos(
          list: state.listTodo,
          timeFilter: selectedFilter,
          searchText: searchController.text,
        ).where((e) => !e.todo.isDone).toList();
        final filteredCompletedTodos = filterTodos(
          list: state.listTodo,
          timeFilter: selectedFilter,
          searchText: searchController.text,
        ).where((e) => e.todo.isDone).toList();
        return Scaffold(
          floatingActionButton: SizedBox(
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
              backgroundColor: AppColors.mediumSlateBlue,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                size: AppSizes.homeAddButtonIconSize,
                color: AppColors.pureWhite,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: AppColors.darkGrey,
            child: SizedBox(
              height: AppSizes.homeBottomNavHeight,
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
                      marginLeft: AppSizes.homeBottomNavItemSpace,
                    ),
                  ),
                  const BottomNavItem(
                    icon: Icons.calendar_month_outlined,
                    label: "Calendar",
                    marginLeft: AppSizes.homeBottomNavItemSpace,
                  ),
                  const Spacer(),
                  const BottomNavItem(
                    icon: Icons.access_time,
                    label: "Focus",
                    marginRight: AppSizes.homeBottomNavItemSpace,
                  ),
                  const BottomNavItem(
                    icon: Icons.person_outline_rounded,
                    label: "Profile",
                    marginRight: AppSizes.homeBottomNavItemSpace,
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            actionsPadding: EdgeInsets.only(
              right: AppSizes.homeHorizontalPadding,
            ),
            backgroundColor: AppColors.black,
            centerTitle: true,
            actions: [
              const CircleAvatar(
                radius: AppSizes.homeAppBarAvatarSize,
                child: Icon(Icons.ac_unit_rounded),
              ),
            ],
            title: Text(
              HomeText.appBarTitle,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.pureWhite87),
            ),
            leading: const Padding(
              padding: EdgeInsets.only(left: AppSizes.homeHorizontalPadding),
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
              padding: EdgeInsets.symmetric(horizontal: AppSizes.homePadding),
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
                            const SizedBox(
                              height: AppSizes.homeEmptyContentTop,
                            ),
                            Text(
                              HomeText.emptyContent,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.pureWhite87),
                            ),
                            const SizedBox(
                              height: AppSizes.homeEmptyInstructionTop,
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
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Container(
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
                              margin: const EdgeInsets.only(
                                top: AppSizes.homeSearchMarginTop,
                                bottom: AppSizes.homeSearchMarginTop,
                              ),
                              padding: const EdgeInsets.all(
                                AppSizes.homeSearchPadding,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/search.svg'),
                                  const SizedBox(
                                    width: AppSizes.homeSearchPadding,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 24,
                                      child: TextFormField(
                                        expands: false,
                                        scrollPadding: EdgeInsets.zero,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        maxLines: 1,
                                        controller: searchController,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.copyWith(
                                              color: AppColors.pureWhite,
                                            ),
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
                                          isDense: true,
                                          contentPadding: EdgeInsets.zero,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              width: AppSizes.dropdownButtonWidth,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: FilterDropdown(
                                  initialValue: selectedFilter,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedFilter = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: const SizedBox(
                              height: AppSizes.homeListSpaceTop,
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              return Column(
                                children: [
                                  UncompletedTodoItem(
                                    todo: filteredUncompletedTodos[index],
                                  ),
                                  const SizedBox(
                                    height: AppSizes.homeListItemSpace,
                                  ),
                                ],
                              );
                            }, childCount: filteredUncompletedTodos.length),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              width: 104,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CompletedDropdown(),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: const SizedBox(
                              height: AppSizes.homeListSpaceTop,
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              return Column(
                                children: [
                                  CompletedTodoItem(
                                    todo: filteredCompletedTodos[index],
                                  ),
                                  const SizedBox(
                                    height: AppSizes.homeListItemSpace,
                                  ),
                                ],
                              );
                            }, childCount: filteredCompletedTodos.length),
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
