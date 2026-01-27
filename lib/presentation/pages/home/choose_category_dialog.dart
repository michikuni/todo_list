import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/presentation/pages/home/category_item.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class ChooseCategoryDialog extends StatelessWidget {
  const ChooseCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.darkGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12),
          Text(
            "Choose Category",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: AppColors.pureWhite87,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 12),

          Divider(height: 1, indent: 8, endIndent: 8,),

          SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: const [
                CategoryItem(
                  icon: 'assets/icons/bread.svg',
                  label: "Grocery",
                  color: Color(0xFFA8FF60),
                ),
                CategoryItem(
                  icon: 'assets/icons/work.svg',
                  label: "Work",
                  color: Color(0xFFFF8A65),
                ),
                CategoryItem(
                  icon: 'assets/icons/sport.svg',
                  label: "Sport",
                  color: Color(0xFF64FFDA),
                ),
                CategoryItem(
                  icon: 'assets/icons/design.svg',
                  label: "Design",
                  color: Color(0xFF4DD0E1),
                ),
                CategoryItem(
                  icon: 'assets/icons/university.svg',
                  label: "University",
                  color: Color(0xFF7986CB),
                ),
                CategoryItem(
                  icon: 'assets/icons/social.svg',
                  label: "Social",
                  color: Color(0xFFF06292),
                ),
                CategoryItem(
                  icon: 'assets/icons/music.svg',
                  label: "Music",
                  color: Color(0xFFD66BFF),
                ),
                CategoryItem(
                  icon: 'assets/icons/heart.svg',
                  label: "Health",
                  color: Color(0xFF69F0AE),
                ),
                CategoryItem(
                  icon: 'assets/icons/movie.svg',
                  label: "Movie",
                  color: Color(0xFF64B5F6),
                ),
                CategoryItem(
                  icon: 'assets/icons/home.svg',
                  label: "Home",
                  color: Color(0xFFFF6E6E),
                ),
                CategoryItem(
                  icon: 'assets/icons/create_new.svg',
                  label: "Create New",
                  color: Color(0xFF5EF2B8),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: Theme.of(context).textTheme.displayLarge
                              ?.copyWith(color: AppColors.mediumSlateBlue),
                        ),
                      ),
                    ),
                  ),
                ),
                PrimaryButtonWidget(
                  height: 48,
                  text: 'Save',
                  width: 140,
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
