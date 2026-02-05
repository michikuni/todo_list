import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/l10n/app_localizations.dart';
import 'package:todo_list/presentation/bloc/task/task_bloc.dart';
import 'package:todo_list/presentation/bloc/task/task_event.dart';
import 'package:todo_list/presentation/bloc/task/task_state.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class EditPriorityDialog extends StatefulWidget {
  const EditPriorityDialog({super.key});

  @override
  State<EditPriorityDialog> createState() => _EditPriorityDialogState();
}

class _EditPriorityDialogState extends State<EditPriorityDialog> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) => Dialog(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.choosePriorityDialogPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppSizes.choosePriorityDialogTitleSpaceTop),
              Text(
                AppLocalizations.of(context)!.priorityTitleText,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
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
                        context.read<TaskBloc>().add(OnPriorityChanged(selected));
                      });
                    },
                    child: Container(
                      width: AppSizes.choosePriorityDialogItemSize,
                      height: AppSizes.choosePriorityDialogItemSize,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
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
                            AppLocalizations.of(context)!.priorityCancelButtonText,
                            style: Theme.of(context).textTheme.displayLarge
                                ?.copyWith(color: Theme.of(context).colorScheme.primary),
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
                      text: AppLocalizations.of(context)!.priorityEditButtonText,
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
