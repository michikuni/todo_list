import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';

class TaskRow extends StatelessWidget {
  const TaskRow({
    super.key,
    required this.taskRowHeight,
    required this.titleSpace,
    required this.titleText,
    required this.detailWidth,
    required this.detailBorderRadius,
    this.iconSize,
    this.detailSpace,
    this.detailColor,
    required this.detailText,
    required this.rowIcon,
    this.categoryIcon,
    required this.onTap
  });
  final double taskRowHeight;
  final double titleSpace;
  final String titleText;
  final double detailWidth;
  final double detailBorderRadius;
  final double? iconSize;
  final double? detailSpace;
  final Color? detailColor;
  final String detailText;
  final Icon rowIcon;
  final SvgPicture? categoryIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: taskRowHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          rowIcon,
          SizedBox(width: titleSpace),
          Text(
            titleText,
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(color: AppColors.pureWhite87),
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(detailBorderRadius),
                color: AppColors.pureWhite21,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.taskRowDetailPaddingHorizontal,
                vertical: AppSizes.taskRowDetailPaddingVertical,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconSize != null)
                    categoryIcon ??
                        Icon(
                          Icons.school_outlined,
                          color: detailColor,
                          size: iconSize,
                        ),
                  if (detailSpace != null) SizedBox(width: detailSpace),
                  Text(
                    detailText,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColors.pureWhite87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
