import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
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
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1),
            color: AppColors.darkGrey,
          ),
          padding: EdgeInsets.fromLTRB(8, 12, 8, 4),
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Edit Task title',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.pureWhite87,
                ),
              ),
              SizedBox(height: 12),
              Divider(height: 1),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: contentSelected
                    ? BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.mediumGrey,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      )
                    : null,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 16),
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
                    hintText: 'Content',
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
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: descriptSelected
                    ? BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.mediumGrey,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      )
                    : null,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 16),
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
                    hintText: 'Description',
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
              SizedBox(height: 28),
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
                        height: 48,
                        child: Center(
                          child: Text(
                            'Cancel',
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
                      height: 48,
                      text: 'Edit',
                      width: 152,
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
