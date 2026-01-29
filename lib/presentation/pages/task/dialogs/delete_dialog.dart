import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';
import 'package:todo_list/presentation/bloc/task/task_bloc.dart';
import 'package:todo_list/presentation/bloc/task/task_event.dart';
import 'package:todo_list/presentation/bloc/task/task_state.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class DeleteTaskDialog extends StatelessWidget {
  const DeleteTaskDialog({super.key, required this.todo});
  final TodoWithKeyEntity todo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 212,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.darkGrey,
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Delete Task',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.pureWhite87,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Divider(height: 1),
              const SizedBox(height: 24),
              Text(
                'Are You sure you want to delete this task?\nTask title : ${todo.todo.content}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.pureWhite87,
                  fontWeight: FontWeight.w500, 
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
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
                        height: 48,
                        text: 'Delete',
                        width: 140,
                        onPressed: () {
                          context.read<TaskBloc>().add(DeleteTask(todo.key));
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
  }
}
