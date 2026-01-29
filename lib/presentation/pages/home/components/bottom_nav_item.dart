import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.marginLeft,
    this.marginRight,
  });
  final IconData icon;
  final String label;
  final double? marginLeft;
  final double? marginRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.homeBottomNavItemWidth,
      height: AppSizes.homeBottomNavItemHeight,
      margin: EdgeInsets.only(left: marginLeft ?? 0, right: marginRight ?? 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: AppSizes.homeBottomNavItemIconSize,
          ),
          SizedBox(height: AppSizes.homeBottomNavItemIconSpaceBottom),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(color: AppColors.pureWhite87),
          ),
        ],
      ),
    );
  }
}
