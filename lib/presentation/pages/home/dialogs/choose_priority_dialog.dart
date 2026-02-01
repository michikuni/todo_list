import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/core/constants/home_dialog_text.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class ChoosePriorityDialog extends StatefulWidget {
  const ChoosePriorityDialog({super.key});

  @override
  State<ChoosePriorityDialog> createState() => _ChoosePriorityDialogState();
}

class _ChoosePriorityDialogState extends State<ChoosePriorityDialog> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Dialog(
        backgroundColor: AppColors.darkGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.choosePriorityDialogPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppSizes.choosePriorityDialogTitleSpaceTop),
              Text(
                HomeDialogText.choosePriorityTitleText,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.pureWhite87,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: AppSizes.choosePriorityDialogDivideSpaceTop),
              Divider(height: 1),
              SizedBox(height: AppSizes.choosePriorityDialogDivideSpaceBottom),
              // Grid numbers
              GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: AppSizes.choosePriorityDialogItemSpace,
                  mainAxisSpacing: AppSizes.choosePriorityDialogItemSpace,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final number = index + 1;
                  final isSelected = number == selected;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = number;
                        context.read<HomeBloc>().add(OnPriorityChanged(selected));
                      });
                    },
                    child: Container(
                      width: AppSizes.choosePriorityDialogItemSize,
                      height: AppSizes.choosePriorityDialogItemSize,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.mediumSlateBlue
                            : AppColors.jetBlack,
                        borderRadius: BorderRadius.circular(AppSizes.choosePriorityDialogItemRadius),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.flag_outlined,
                            color: isSelected
                                ? Colors.white
                                : Colors.grey.shade400,
                            size: AppSizes.choosePriorityDialogItemIconSize,
                          ),
                          const SizedBox(height: AppSizes.choosePriorityDialogItemSpaceBottom),
                          Text(
                            "$number",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: AppSizes.choosePriorityDialogButtonSpaceTop),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: SizedBox(
                        height: AppSizes.choosePriorityDialogButtonHeight,
                        child: Center(
                          child: Text(
                            HomeDialogText.choosePriorityCancelButtonText,
                            style: Theme.of(context).textTheme.displayLarge
                                ?.copyWith(color: AppColors.mediumSlateBlue),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppSizes.choosePriorityDialogButtonSpaceBetween),
                  Expanded(
                    child: PrimaryButtonWidget(
                      isValid: true,
                      height: AppSizes.choosePriorityDialogButtonHeight,
                      text: HomeDialogText.choosePrioritySaveButtonText,
                      width: AppSizes.choosePriorityDialogPrimaryButtonWidth,
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
