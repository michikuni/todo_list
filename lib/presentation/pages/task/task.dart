import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_router_path.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/core/constants/assets_path.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';
import 'package:todo_list/l10n/app_localizations.dart';
import 'package:todo_list/presentation/bloc/task/task_bloc.dart';
import 'package:todo_list/presentation/bloc/task/task_event.dart';
import 'package:todo_list/presentation/bloc/task/task_state.dart';
import 'package:todo_list/presentation/pages/home/utils/filter_todo_function.dart';
import 'package:todo_list/presentation/pages/task/components/task_row_component.dart';
import 'package:todo_list/presentation/pages/task/dialogs/delete_dialog.dart';
import 'package:todo_list/presentation/pages/task/dialogs/edit_category_dialog.dart';
import 'package:todo_list/presentation/pages/task/dialogs/edit_date_dialog.dart';
import 'package:todo_list/presentation/pages/task/dialogs/edit_priority_dialog.dart';
import 'package:todo_list/presentation/pages/task/dialogs/edit_task_dialog.dart';
import 'package:todo_list/presentation/utils/extension_localizations.dart';
import 'package:todo_list/presentation/widgets/circle_check.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class TaskPageWidget extends StatefulWidget {
  const TaskPageWidget({super.key, required this.todo});
  final TodoWithKeyEntity todo; 
  @override
  State<TaskPageWidget> createState() => _TaskPageWidgetState();
}

class _TaskPageWidgetState extends State<TaskPageWidget> {
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(
      LoadData(
        widget.todo.todo.avatar,
        widget.todo.todo.email,
        widget.todo.todo.name,
        widget.todo.todo.userId,
      ),

    );
    context.read<TaskBloc>().add(OnCategoryChanged(widget.todo.todo.category));
    context.read<TaskBloc>().add(OnDone(widget.todo.todo.isDone));
    context.read<TaskBloc>().add(OnContentChanged(widget.todo.todo.content));
    context.read<TaskBloc>().add(OnDateChanged(widget.todo.todo.date));
    context.read<TaskBloc>().add(OnDesciptionChanged(widget.todo.todo.description));
    context.read<TaskBloc>().add(OnPriorityChanged(widget.todo.todo.priority));
    context.read<TaskBloc>().add(OnTimeChanged(widget.todo.todo.minutes));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: Center(
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: AppSizes.taskAppBarIconSize,
              height: AppSizes.taskAppBarIconSize,
              margin: EdgeInsets.only(left: AppSizes.taskPageHorizontalMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppSizes.taskAppBarIconRadius,
                ),
                color: Theme.of(context).colorScheme.secondaryFixed,
              ),
              child: Center(
                child: Icon(Icons.close_rounded, color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
        ),
        actions: [
          Container(
            width: AppSizes.taskAppBarIconSize,
            height: AppSizes.taskAppBarIconSize,
            margin: EdgeInsets.only(right: AppSizes.taskPageHorizontalMargin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppSizes.taskAppBarIconRadius,
              ),
              color: Theme.of(context).colorScheme.secondaryFixed,
            ),
            child: Center(
              child: Icon(Icons.repeat_rounded, color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) => Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).colorScheme.primaryContainer,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.taskPageHorizontalMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Content, description
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppSizes.taskTitleCircleCheckPaddingTop,
                    ),
                    child: CircleCheck(
                      radioColor: Theme.of(context).colorScheme.primary,
                      value: state.isDone,
                      onChanged: (val) {
                        setState(() {
                          context.read<TaskBloc>().add(OnDone(val));
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: AppSizes.taskTitleSpace),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSizes.taskTitleTextPaddingTop),
                        Text(
                          state.content,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                          maxLines: AppSizes.taskTitleTextMaxLine,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: AppSizes.taskTitleTextSpace),
                        Text(
                         state.description,
                          style: Theme.of(context).textTheme.displayLarge
                              ?.copyWith(color: Theme.of(context).colorScheme.secondaryFixedDim),
                          maxLines: AppSizes.taskTitleTextMaxLine,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSizes.taskTitleSpace),
                  GestureDetector(
                    onTap: () {
                      final taskBloc = context.read<TaskBloc>();
                      showDialog(
                        context: context,
                        builder: (context) => BlocProvider.value(
                          value: taskBloc,
                          child: EditTaskDialog(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: AppSizes.taskTitleIconSize,
                      height: AppSizes.taskTitleIconSize,
                      child: Center(
                        child: SvgPicture.asset(AssetsPath.editIcon)
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.taskTitleToRowSpace),
              //Task Time Row
              TaskRow(
                onTap: () {
                  final taskBloc = context.read<TaskBloc>();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return BlocProvider.value(
                        value: taskBloc,
                        child: EditDateDialog(),
                      );
                    },
                  );
                },
                taskRowHeight: AppSizes.taskRowHeight,
                titleSpace: AppSizes.taskRowTitleSpace,
                titleText: l10n.taskTimeText,
                detailWidth: AppSizes.taskRowTimeDetailWidth,
                detailBorderRadius: AppSizes.taskRowRadius,
                detailText: formatDateWithMinutes(
                  state.date,
                  state.minutes,
                ),
                rowIcon: SvgPicture.asset(AssetsPath.timerIcon),
              ),
              const SizedBox(height: AppSizes.taskRowSpace),

              //Task Category Row
              TaskRow(
                onTap: () {
                  final taskBloc = context.read<TaskBloc>();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return BlocProvider.value(
                        value: taskBloc,
                        child: EditCategoryDialog(),
                      );
                    },
                  );
                },
                taskRowHeight: AppSizes.taskRowHeight,
                titleSpace: AppSizes.taskRowTitleSpace,
                titleText: l10n.taskCategoryText,
                detailWidth: AppSizes.taskRowCategoryDetailWidth,
                detailBorderRadius: AppSizes.taskRowRadius,
                detailText: l10n.categoryName(state.category.name.toLowerCase()),
                rowIcon: SvgPicture.asset(AssetsPath.categoryIcon),
                iconSize: AppSizes.taskRowCategoryIconSize,
                detailColor: Color(widget.todo.todo.category.color),
                detailSpace: AppSizes.taskRowCategoryDetailSpace,
                categoryIcon: SvgPicture.asset(
                  state.category.icon,
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(height: AppSizes.taskRowSpace),

              //Task Priority Row
              TaskRow(
                onTap: () {
                  final taskBloc = context.read<TaskBloc>();
                  showDialog(context: context, builder: (context) {
                    return BlocProvider.value(value: taskBloc, child: EditPriorityDialog(),);
                  },);
                },
                taskRowHeight: AppSizes.taskRowHeight,
                titleSpace: AppSizes.taskRowTitleSpace,
                titleText: l10n.taskPriorityText,
                detailWidth: AppSizes.taskRowPriorityDetailWidth,
                detailBorderRadius: AppSizes.taskRowRadius,
                detailText: state.priority.toString(),
                rowIcon: SvgPicture.asset(AssetsPath.priorityIcon),
              ),
              const SizedBox(height: AppSizes.taskRowSpace),

              //Task Sub Row
              TaskRow(
                onTap: () {},
                taskRowHeight: AppSizes.taskRowHeight,
                titleSpace: AppSizes.taskRowTitleSpace,
                titleText: l10n.taskSubText,
                detailWidth: AppSizes.taskRowSubDetailWidth,
                detailBorderRadius: AppSizes.taskAppBarIconRadius,
                detailText: l10n.taskDefaultSubText,
                rowIcon: SvgPicture.asset(AssetsPath.accountTreeIcon)
              ),
              SizedBox(height: AppSizes.taskDeleteSpaceTop),

              //Delete Task Row
              GestureDetector(
                onTap: () {
                  final taskBloc = context.read<TaskBloc>();
                  showDialog(context: context, builder: (context) {
                    return BlocProvider.value(value: taskBloc, child: DeleteTaskDialog(todo: widget.todo),);
                  },);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(AssetsPath.trashIcon),
                    SizedBox(width: AppSizes.taskRowTitleSpace),
                    Text(
                      l10n.taskDeleteText,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: AppColors.coralRed,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),

              //Button
              PrimaryButtonWidget(
                isValid: true,
                height: AppSizes.taskPrimaryButtonHeight,
                text: l10n.taskButtonPrimaryText,
                width: double.infinity,
                onPressed: () {
                  context.read<TaskBloc>().add(OnSubmit(widget.todo.key));
                  context.push(AppRouterPath.gateRouter);
                },
              ),
              SizedBox(height: AppSizes.taskPageBottomHorizontalMargin),
            ],
          ),
        ),
      ),
    );
  }
}
