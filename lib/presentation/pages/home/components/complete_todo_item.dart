import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_router_path.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';
import 'package:todo_list/presentation/pages/home/utils/filter_todo_function.dart';
import 'package:todo_list/presentation/widgets/circle_check.dart';

class CompletedTodoItem extends StatelessWidget {
  const CompletedTodoItem({
    super.key,
    required this.todo,
    required this.onChanged,
  });
  final TodoWithKeyEntity todo;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouterPath.taskRouter, extra: todo);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: AppSizes.uncompleteTodoItemHeight,
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimaryContainer),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleCheck(
                  radioColor: Theme.of(context).colorScheme.primary,
                  value: false,
                  onChanged: onChanged,
                  padding: AppSizes.uncompleteTodoItemPaddingHorizontal,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        todo.todo.content,
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: AppSizes.uncompleteTodoItemContentSpaceBottom,
                      ),
                      Text(
                        formatDateWithMinutes(
                          todo.todo.date,
                          todo.todo.minutes,
                        ),
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
