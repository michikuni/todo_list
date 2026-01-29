import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: AppSizes.categoryItemHeight,
        child: Column(
          children: [
            Container(
              height: AppSizes.categoryItemIconSize,
              width: AppSizes.categoryItemIconSize,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(
                  AppSizes.categoryItemIconRadius,
                ),
                border: isSelected
                    ? Border.all(color: AppColors.pureWhite, width: 1)
                    : null,
              ),
              margin: EdgeInsets.only(
                bottom: AppSizes.categoryItemIconMarginBottom,
              ),
              padding: const EdgeInsets.all(
                AppSizes.categoryItemIconPadding,
              ),
              child: SvgPicture.asset(icon),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: AppColors.pureWhite87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
