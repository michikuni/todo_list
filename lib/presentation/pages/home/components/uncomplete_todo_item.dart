import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/presentation/widgets/circle_check.dart';

class UncompletedTodoItem extends StatelessWidget {
  const UncompletedTodoItem({
    super.key,
    required this.content,
    required this.category,
    required this.description,
    required this.priority,
  });
  final String content;
  final String description;
  final String category;
  final int priority;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: AppSizes.uncompleteTodoItemHeight,
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: AppSizes.uncompleteTodoItemPaddingHorizontal),
              CircleCheck(value: false, onChanged: (value) {}),
              SizedBox(width: AppSizes.uncompleteTodoItemPaddingHorizontal),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    content,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.pureWhite87,
                    ),
                  ),
                  SizedBox(height: AppSizes.uncompleteTodoItemContentSpaceBottom),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppColors.pureWhite87,
                    ),
                  ),
                ],
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
                width: AppSizes.uncompleteTodoItemCategoryWidth,
                height: AppSizes.uncompleteTodoItemCategoryHeight,
                decoration: BoxDecoration(
                  color: AppColors.blueSkyLight,
                  borderRadius: BorderRadius.circular(AppSizes.uncompleteTodoItemRadius),
                ),
                child: Center(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/bread.svg'),
                      Text(
                        category,
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(color: AppColors.pureWhite),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: AppSizes.uncompleteTodoItemPrioritySpaceLeft),
              Container(
                width: AppSizes.uncompleteTodoItemPriorityWidth,
                height: AppSizes.uncompleteTodoItemPriorityHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.uncompleteTodoItemRadius),
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
                        '$priority',
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
    );
  }
}
