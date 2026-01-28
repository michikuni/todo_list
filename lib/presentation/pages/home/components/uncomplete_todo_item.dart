import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/constants/app_colors.dart';
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
          height: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.darkGrey,
          ),
          padding: EdgeInsets.all(4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 12),
              CircleCheck(value: false, onChanged: (value) {}),
              SizedBox(width: 16),
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
                  SizedBox(height: 6),
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
          bottom: 4,
          right: 12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 88,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.blueSkyLight,
                  borderRadius: BorderRadius.circular(4),
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
              SizedBox(width: 12),
              Container(
                width: 44,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
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
