import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_router_path.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';
import 'package:todo_list/presentation/pages/home/utils/filter_todo_function.dart';
import 'package:todo_list/presentation/widgets/circle_check.dart';

class UncompletedTodoItem extends StatelessWidget {
  const UncompletedTodoItem({
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
            decoration: BoxDecoration(color: AppColors.darkGrey),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(width: AppSizes.uncompleteTodoItemPaddingHorizontal),
                CircleCheck(
                  value: false,
                  onChanged: onChanged,
                  padding: AppSizes.uncompleteTodoItemPaddingHorizontal,
                ),
                // SizedBox(width: AppSizes.uncompleteTodoItemPaddingHorizontal),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        todo.todo.content,
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(color: AppColors.pureWhite87),
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
                            ?.copyWith(color: AppColors.pureWhite87),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: AppSizes.uncompleteTodoItemPrioritySpaceBottom,
            right: AppSizes.uncompleteTodoItemPrioritySpaceRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: AppSizes.uncompleteTodoItemCategoryHeight,
                  decoration: BoxDecoration(
                    color: Color(todo.todo.category.color),
                    borderRadius: BorderRadius.circular(
                      AppSizes.uncompleteTodoItemRadius,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        AppSizes.uncompleteTodoItemCategoryPaddingHorizontal,
                    vertical:
                        AppSizes.uncompleteTodoItemCategoryPaddingHorizontal,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        todo.todo.category.icon,
                        width: AppSizes.uncompleteTodoItemCategoryIconSize,
                        height: AppSizes.uncompleteTodoItemCategoryIconSize,
                      ),
                      SizedBox(
                        width:
                            AppSizes.uncompleteTodoItemCategoryIconSpaceRight,
                      ),
                      Text(
                        todo.todo.category.name,
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(color: AppColors.pureWhite),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppSizes.uncompleteTodoItemPrioritySpaceLeft),
                Container(
                  width: AppSizes.uncompleteTodoItemPriorityWidth,
                  height: AppSizes.uncompleteTodoItemPriorityHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppSizes.uncompleteTodoItemRadius,
                    ),
                    border: Border.all(
                      color: AppColors.mediumSlateBlue,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(Icons.flag_outlined, color: AppColors.pureWhite87),
                        Text(
                          '${todo.todo.priority}',
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(color: AppColors.pureWhite),
                        ),
                      ],
                    ),
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
