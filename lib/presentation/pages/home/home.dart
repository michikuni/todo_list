import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/core/constants/assets_path.dart';
import 'package:todo_list/l10n/app_localizations.dart';
import 'package:todo_list/presentation/bloc/gate/auth_bloc.dart';
import 'package:todo_list/presentation/bloc/gate/auth_event.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';
import 'package:todo_list/presentation/pages/home/components/bottom_nav_item.dart';
import 'package:todo_list/presentation/pages/home/components/complete_todo_item.dart';
import 'package:todo_list/presentation/pages/home/components/completed_dropdown_button.dart';
import 'package:todo_list/presentation/pages/home/components/filter_dropdown_button.dart';
import 'package:todo_list/presentation/pages/home/components/uncomplete_todo_item.dart';
import 'package:todo_list/presentation/pages/home/dialogs/add_task_dialog.dart';
import 'package:todo_list/presentation/pages/home/utils/filter_todo_function.dart';
import 'package:todo_list/presentation/widgets/loading_dialog.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  TimeFilter selectedFilter = TimeFilter.all;
  late TextEditingController searchController;
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didChangeDependencies() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 600).animate(animationController);
    animationController.forward();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.inProgress) {
          showDialog(context: context, builder: (context) => LoadingDialog());
        }
        if (state.status == FormzSubmissionStatus.success) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final avatarUrl = state.avatar;
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
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.read<AuthBloc>().add(OnChangedLocale(Locale('vi')));
                        },
                        child: BottomNavItem(
                          icon: Icons.home_filled,
                          label: AppLocalizations.of(context)!.bottomBarIndexLabel,
                          marginLeft: (screenWidth * 0.05),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.read<AuthBloc>().add(OnChangedLocale(Locale('en')));
                        },
                        child: BottomNavItem(
                          icon: Icons.calendar_month_outlined,
                          label: AppLocalizations.of(context)!.bottomBarCalendarLabel,
                          marginLeft: (screenWidth * 0.05),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: BottomNavItem(
                        icon: Icons.access_time,
                        label: AppLocalizations.of(context)!.bottomBarFocusLabel,
                        marginRight: (screenWidth * 0.05),
                      ),
                    ),
                    Expanded(
                      child: BottomNavItem(
                        icon: Icons.person_outline_rounded,
                        label: AppLocalizations.of(context)!.bottomBarProfileLabel,
                        marginRight: (screenWidth * 0.05),
                      ),
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
                GestureDetector(
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLoggedOut());
                  },
                  child: CircleAvatar(
                    radius: AppSizes.homeAppBarAvatarSize,
                    child: ClipOval(
                      child: Image.network(
                        avatarUrl.isNotEmpty
                            ? avatarUrl
                            : AssetsPath.defaultImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
              title: Text(
                AppLocalizations.of(context)!.homeAppBarTitle,
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
                              Image.asset(AssetsPath.emptyImageAssets),
                              const SizedBox(
                                height: AppSizes.homeEmptyContentTop,
                              ),
                              Text(
                                AppLocalizations.of(context)!.homeEmptyContent,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: AppColors.pureWhite87),
                              ),
                              const SizedBox(
                                height: AppSizes.homeEmptyInstructionTop,
                              ),
                              Text(
                                AppLocalizations.of(context)!.homeEmptyInstruction,
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
                                    SvgPicture.asset(AssetsPath.homeSearchIcon),
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
                                              AppLocalizations.of(context)!.searchHint,
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
                                      onChanged: (value) {
                                        context.read<HomeBloc>().add(
                                          OnChangedCompletedStatus(
                                            filteredUncompletedTodos[index],
                                          ),
                                        );
                                      },
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
                                      onChanged: (value) {
                                        context.read<HomeBloc>().add(
                                          OnChangedCompletedStatus(
                                            filteredCompletedTodos[index],
                                          ),
                                        );
                                      },
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
      ),
    );
  }
}
