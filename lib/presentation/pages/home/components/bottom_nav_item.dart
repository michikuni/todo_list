import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.marginLeft,
    this.marginRight    
  });
  final IconData icon;
  final String label;
  final double? marginLeft;
  final double? marginRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 44,
      margin: EdgeInsets.only(left: marginLeft ?? 0, right: marginRight ?? 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          SizedBox(height: 4),
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
