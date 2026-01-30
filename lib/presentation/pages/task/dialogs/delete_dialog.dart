import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';
import 'package:todo_list/presentation/bloc/gate/auth_bloc.dart';
import 'package:todo_list/presentation/bloc/gate/auth_event.dart';
import 'package:todo_list/presentation/bloc/task/task_bloc.dart';
import 'package:todo_list/presentation/bloc/task/task_event.dart';
import 'package:todo_list/presentation/bloc/task/task_state.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class DeleteTaskDialog extends StatelessWidget {
  const DeleteTaskDialog({super.key, required this.todo});
  final TodoWithKeyEntity todo;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.inProgress) {
          print(state.status);
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        }
        if(state.status == FormzSubmissionStatus.success){
          print(state.status);
          context.read<AuthBloc>().add(AuthCheckEvent());
          context.go('/');
        }
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.darkGrey,
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Row(
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
                      isValid: true,
                      text: 'Delete',
                      width: 140,
                      onPressed: () {
                        print(todo.key);
                        context.read<TaskBloc>().add(DeleteTask(todo.key));
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
