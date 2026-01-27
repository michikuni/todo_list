import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/constants/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 556,
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.all(16),
            child: SvgPicture.asset(icon),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppColors.pureWhite87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
