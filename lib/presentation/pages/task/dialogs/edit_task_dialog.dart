import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/core/constants/task_dialog_text.dart';
import 'package:todo_list/presentation/bloc/task/task_bloc.dart';
import 'package:todo_list/presentation/bloc/task/task_event.dart';
import 'package:todo_list/presentation/bloc/task/task_state.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class EditTaskDialog extends StatefulWidget {
  const EditTaskDialog({super.key});

  @override
  State<EditTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<EditTaskDialog> {
  bool contentSelected = true;
  bool descriptSelected = false;
  late TextEditingController contentController;
  late TextEditingController desciptionController;

  @override
  void initState() {
    super.initState();
    final state = context.read<TaskBloc>().state;
    contentController = TextEditingController(text: state.content);
    desciptionController = TextEditingController(text: state.description);
  }

  @override
  void dispose() {
    super.dispose();
    contentController.dispose();
    desciptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) => Dialog(
        backgroundColor: AppColors.darkGrey,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.editTaskDialogRadius),
            border: Border.all(width: 1),
            color: AppColors.darkGrey,
          ),
          padding: EdgeInsets.fromLTRB(
            AppSizes.editTaskDialogPaddingHorizontal,
            AppSizes.editTaskDialogPaddingTop,
            AppSizes.editTaskDialogPaddingHorizontal,
            AppSizes.editTaskDialogPaddingBottom,
          ),
          height: AppSizes.editTaskDialogHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                TaskDialogText.editTitleText,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.pureWhite87,
                ),
              ),
              SizedBox(height: AppSizes.editTaskDialogTitlePaddingBottom),
              Divider(height: 1),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppSizes.editTaskDialogInputMarginHorizontal,
                  vertical: AppSizes.editTaskDialogInputMarginVertical,
                ),
                decoration: contentSelected
                    ? BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.mediumGrey,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppSizes.editTaskDialogRadius,
                        ),
                      )
                    : null,
                height: AppSizes.editTaskDialogInputHeight,
                padding: EdgeInsets.symmetric(horizontal: contentSelected ? AppSizes.editTaskDialogInputPaddingHorizontal : 0),
                child: TextFormField(
                  expands: false,
                  scrollPadding: EdgeInsets.zero,
                  textAlignVertical: TextAlignVertical.center,
                  maxLines: 1,
                  controller: contentController,
                  onTap: () {
                    setState(() {
                      contentSelected = true;
                      descriptSelected = false;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: TaskDialogText.editContentHint,
                    hintStyle: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: AppColors.grey),
                    border: InputBorder.none,
                  ),
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.pureWhite87),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: AppSizes.editTaskDialogInputMarginHorizontal),
                decoration: descriptSelected
                    ? BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.mediumGrey,
                        ),
                        borderRadius: BorderRadius.circular(AppSizes.editTaskDialogRadius),
                      )
                    : null,
                height: AppSizes.editTaskDialogInputHeight,
                padding: EdgeInsets.symmetric(horizontal: descriptSelected ? AppSizes.editTaskDialogInputPaddingHorizontal : 0),
                child: TextFormField(
                  expands: false,
                  scrollPadding: EdgeInsets.zero,
                  textAlignVertical: TextAlignVertical.center,
                  maxLines: 1,
                  controller: desciptionController,
                  onTap: () {
                    setState(() {
                      contentSelected = false;
                      descriptSelected = true;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: TaskDialogText.editDescriptionHint,
                    hintStyle: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: AppColors.grey),
                    border: InputBorder.none,
                  ),
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.pureWhite87),
                ),
              ),
              SizedBox(height: AppSizes.editTaskDialogButtonSpaceTop),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: SizedBox(
                        height: AppSizes.editDialogButtonHeight,
                        child: Center(
                          child: Text(
                            TaskDialogText.editCancelButtonText,
                            style: Theme.of(context).textTheme.displayLarge
                                ?.copyWith(color: AppColors.mediumSlateBlue),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: PrimaryButtonWidget(
                      isValid: true,
                      height: AppSizes.editDialogButtonHeight,
                      text: TaskDialogText.editEditButtonText,
                      width: AppSizes.editDialogButtonWidth,
                      onPressed: () {
                        context.read<TaskBloc>().add(
                          OnContentChanged(contentController.text),
                        );
                        context.read<TaskBloc>().add(
                          OnDesciptionChanged(desciptionController.text),
                        );
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
