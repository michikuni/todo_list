import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';
import 'package:todo_list/presentation/pages/home/category_item.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class ChooseCategoryDialog extends StatefulWidget {
  const ChooseCategoryDialog({super.key});

  @override
  State<ChooseCategoryDialog> createState() => _ChooseCategoryDialogState();
}

class _ChooseCategoryDialogState extends State<ChooseCategoryDialog> {
  Category selectedCategory = Category.home;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Dialog(
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  CategoryItem(
                    icon: 'assets/icons/bread.svg',
                    label: "Grocery",
                    color: Color(0xFFA8FF60),
                    isSelected: (selectedCategory == Category.grocery),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.grocery;
                        context.read<HomeBloc>().add(OnCategoryChanged(Category.grocery));
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/work.svg',
                    label: "Work",
                    color: Color(0xFFFF8A65),
                    isSelected: (selectedCategory == Category.work),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.work;
                        context.read<HomeBloc>().add(OnCategoryChanged(Category.work));
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/sport.svg',
                    label: "Sport",
                    color: Color(0xFF64FFDA),
                    isSelected: (selectedCategory == Category.sports),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.sports;
                        context.read<HomeBloc>().add(OnCategoryChanged(Category.sports));
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/design.svg',
                    label: "Design",
                    color: Color(0xFF4DD0E1),
                    isSelected: (selectedCategory == Category.design),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.design;
                        context.read<HomeBloc>().add(OnCategoryChanged(Category.design));
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/university.svg',
                    label: "University",
                    color: Color(0xFF7986CB),
                    isSelected: (selectedCategory == Category.university),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.university;
                        context.read<HomeBloc>().add(OnCategoryChanged(Category.university));
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/social.svg',
                    label: "Social",
                    color: Color(0xFFF06292),
                    isSelected: (selectedCategory == Category.social),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.social;
                        context.read<HomeBloc>().add(OnCategoryChanged(Category.social));
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/music.svg',
                    label: "Music",
                    color: Color(0xFFD66BFF),
                    isSelected: (selectedCategory == Category.music),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.music;
                        context.read<HomeBloc>().add(OnCategoryChanged(Category.music));
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/heart.svg',
                    label: "Health",
                    color: Color(0xFF69F0AE),
                    isSelected: (selectedCategory == Category.health),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.health;
                        context.read<HomeBloc>().add(OnCategoryChanged(Category.health));
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/movie.svg',
                    label: "Movie",
                    color: Color(0xFF64B5F6),
                    isSelected: (selectedCategory == Category.movie),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.movie;
                        context.read<HomeBloc>().add(OnCategoryChanged(Category.movie));
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/home.svg',
                    label: "Home",
                    color: Color(0xFFFF6E6E),
                    isSelected: (selectedCategory == Category.home),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.home;
                        context.read<HomeBloc>().add(OnCategoryChanged(Category.home));
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/create_new.svg',
                    label: "Create New",
                    color: Color(0xFF5EF2B8),
                    isSelected: (selectedCategory == Category.create),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.create;
                        context.read<HomeBloc>().add(OnCategoryChanged(Category.create));
                      });
                    },
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
      ),
    );
  }
}
