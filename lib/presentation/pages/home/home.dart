import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/core/constants/home_text.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';
import 'package:todo_list/presentation/pages/home/add_task_dialog.dart';

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
                  _buildNavItem(
                    Icons.home_filled,
                    "Index",
                    context,
                    marginLeft: 20,
                  ),
                  _buildNavItem(
                    Icons.calendar_month_outlined,
                    "Calendar",
                    context,
                    marginLeft: 20,
                  ),
                  Spacer(),
                  _buildNavItem(
                    Icons.access_time,
                    "Focus",
                    context,
                    marginRight: 20,
                  ),
                  _buildNavItem(
                    Icons.person_outline_rounded,
                    "Profile",
                    context,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    BuildContext context, {
    double? marginLeft,
    double? marginRight,
  }) {
    return Container(
      width: 52,
      height: 44,
      margin: EdgeInsets.only(left: marginLeft ?? 0, right: marginRight ?? 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(color: AppColors.pureWhite87),
          ),
        ],
      ),
    );
  }
}
