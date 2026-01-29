import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';
import 'package:todo_list/presentation/pages/home/components/category_item.dart';
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.chooseCategoryDialogRadius,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppSizes.chooseCategoryDialogTitleSpace),
            Text(
              'Choose Category',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: AppColors.pureWhite87,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: AppSizes.chooseCategoryDialogTitleSpace),
            Divider(
              height: 1,
              indent: AppSizes.chooseCategoryDialogDivideIndent,
              endIndent: AppSizes.chooseCategoryDialogDivideIndent,
            ),
            SizedBox(height: AppSizes.chooseCategoryDialogTitleSpace),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.chooseCategoryDialogPaddingHorizontal),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: AppSizes.chooseCategoryDialogItemSpace,
                crossAxisSpacing: AppSizes.chooseCategoryDialogItemSpace,
                children: [
                  CategoryItem(
                    icon: 'assets/icons/bread.svg',
                    label: "Grocery",
                    color: AppColors.limeGreen,
                    isSelected: (selectedCategory == Category.grocery),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.grocery;
                        context.read<HomeBloc>().add(
                          OnCategoryChanged(Category.grocery),
                        );
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/work.svg',
                    label: "Work",
                    color: AppColors.coralPeach,
                    isSelected: (selectedCategory == Category.work),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.work;
                        context.read<HomeBloc>().add(
                          OnCategoryChanged(Category.work),
                        );
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/sport.svg',
                    label: "Sport",
                    color: AppColors.aqua,
                    isSelected: (selectedCategory == Category.sports),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.sports;
                        context.read<HomeBloc>().add(
                          OnCategoryChanged(Category.sports),
                        );
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/design.svg',
                    label: "Design",
                    color: AppColors.lightAqua,
                    isSelected: (selectedCategory == Category.design),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.design;
                        context.read<HomeBloc>().add(
                          OnCategoryChanged(Category.design),
                        );
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/university.svg',
                    label: "University",
                    color: AppColors.skyBlue,
                    isSelected: (selectedCategory == Category.university),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.university;
                        context.read<HomeBloc>().add(
                          OnCategoryChanged(Category.university),
                        );
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/social.svg',
                    label: "Social",
                    color: AppColors.pinkishPurple,
                    isSelected: (selectedCategory == Category.social),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.social;
                        context.read<HomeBloc>().add(
                          OnCategoryChanged(Category.social),
                        );
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/music.svg',
                    label: "Music",
                    color: AppColors.pinkLight,
                    isSelected: (selectedCategory == Category.music),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.music;
                        context.read<HomeBloc>().add(
                          OnCategoryChanged(Category.music),
                        );
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/heart.svg',
                    label: "Health",
                    color: AppColors.greenMint,
                    isSelected: (selectedCategory == Category.health),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.health;
                        context.read<HomeBloc>().add(
                          OnCategoryChanged(Category.health),
                        );
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/movie.svg',
                    label: "Movie",
                    color: AppColors.blueSkyLight,
                    isSelected: (selectedCategory == Category.movie),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.movie;
                        context.read<HomeBloc>().add(
                          OnCategoryChanged(Category.movie),
                        );
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/home.svg',
                    label: "Home",
                    color: AppColors.lightCoralRed,
                    isSelected: (selectedCategory == Category.home),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.home;
                        context.read<HomeBloc>().add(
                          OnCategoryChanged(Category.home),
                        );
                      });
                    },
                  ),
                  CategoryItem(
                    icon: 'assets/icons/create_new.svg',
                    label: "Create New",
                    color: AppColors.aquaSoft,
                    isSelected: (selectedCategory == Category.create),
                    onTap: () {
                      setState(() {
                        selectedCategory = Category.create;
                        context.read<HomeBloc>().add(
                          OnCategoryChanged(Category.create),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.chooseCategoryDialogButtonSpaceTop,),
            Padding(
              padding: EdgeInsets.all(AppSizes.chooseCategoryDialogButtonPadding),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: SizedBox(
                        height: AppSizes.chooseCategoryDialogButtonHeight,
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
                    height: AppSizes.chooseCategoryDialogButtonHeight,
                    text: 'Save',
                    width: AppSizes.chooseCategoryDialogPrimaryButtonWidth,
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
