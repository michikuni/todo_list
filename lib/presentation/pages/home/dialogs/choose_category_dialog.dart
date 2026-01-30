import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';
import 'package:todo_list/presentation/pages/home/components/category_item.dart';
import 'package:todo_list/presentation/pages/home/utils/default_category.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class ChooseCategoryDialog extends StatefulWidget {
  const ChooseCategoryDialog({super.key});

  @override
  State<ChooseCategoryDialog> createState() => _ChooseCategoryDialogState();
}

class _ChooseCategoryDialogState extends State<ChooseCategoryDialog> {
  Category selectedCategory = categories[9];
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
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.chooseCategoryDialogPaddingHorizontal,
              ),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: AppSizes.chooseCategoryDialogItemSpace,
                crossAxisSpacing: AppSizes.chooseCategoryDialogItemSpace,
                children: categories.map((category) {
                  final isSelected = selectedCategory.name.toLowerCase() == category.name.toLowerCase();

                  return CategoryItem(
                    icon: category.icon,
                    label: category.name,
                    color: Color(category.color),
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                        context.read<HomeBloc>().add(
                          OnCategoryChanged(category),
                        );
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: AppSizes.chooseCategoryDialogButtonSpaceTop),
            Padding(
              padding: EdgeInsets.all(
                AppSizes.chooseCategoryDialogButtonPadding,
              ),
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
                    isValid: true,
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
