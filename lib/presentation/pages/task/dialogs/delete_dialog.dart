import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_router_path.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';
import 'package:todo_list/l10n/app_localizations.dart';
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
          // print(state.status);
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        }
        if(state.status == FormzSubmissionStatus.success){
          // print(state.status);
          context.read<AuthBloc>().add(AuthCheckEvent());
          context.go(AppRouterPath.gateRouter);
        }
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.deleteDialogRadius),
            color: AppColors.darkGrey,
          ),
          padding: EdgeInsets.all(AppSizes.deleteDialogPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.deleteTaskTitleText,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.pureWhite87,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSizes.deleteDialogDivideSpaceTop),
              Divider(height: 1),
              const SizedBox(height: AppSizes.deleteDialogDivideSpaceBottom),
              Text(
                '${AppLocalizations.of(context)!.deleteTaskContentText}${todo.todo.content}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.pureWhite87,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSizes.deleteDialogContentSpaceBottom),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: SizedBox(
                        height: AppSizes.deleteDialogButtonHeight,
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.deleteTaskCancelButtonText,
                            style: Theme.of(context).textTheme.displayLarge
                                ?.copyWith(color: AppColors.mediumSlateBlue),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: PrimaryButtonWidget(
                      height: AppSizes.deleteDialogButtonHeight,
                      isValid: true,
                      text: AppLocalizations.of(context)!.deleteTaskDeleteButtonText,
                      width: AppSizes.deleteDialogButtonWidth,
                      onPressed: () {
                        // print(todo.key);
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
