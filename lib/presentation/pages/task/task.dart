import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/core/constants/task_text.dart';
import 'package:todo_list/presentation/pages/task/task_row_component.dart';
import 'package:todo_list/presentation/widgets/circle_check.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class TaskPageWidget extends StatefulWidget {
  const TaskPageWidget({super.key});
  @override
  State<TaskPageWidget> createState() => _TaskPageWidgetState();
}

class _TaskPageWidgetState extends State<TaskPageWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: Center(
          child: Container(
            width: AppSizes.taskAppBarIconSize,
            height: AppSizes.taskAppBarIconSize,
            margin: EdgeInsets.only(left: AppSizes.taskPageHorizontalMargin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppSizes.taskAppBarIconRadius,
              ),
              color: AppColors.eerieBlack,
            ),
            child: Center(
              child: Icon(Icons.close_rounded, color: AppColors.pureWhite87),
            ),
          ),
        ),
        actions: [
          Container(
            width: AppSizes.taskAppBarIconSize,
            height: AppSizes.taskAppBarIconSize,
            margin: EdgeInsets.only(right: AppSizes.taskPageHorizontalMargin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppSizes.taskAppBarIconRadius,
              ),
              color: AppColors.eerieBlack,
            ),
            child: Center(
              child: Icon(Icons.repeat_rounded, color: AppColors.pureWhite87),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.black,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.taskPageHorizontalMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Content, description
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppSizes.taskTitleCircleCheckPaddingTop,
                  ),
                  child: CircleCheck(
                    value: isSelected,
                    onChanged: (val) {
                      setState(() {
                        isSelected = val;
                      });
                    },
                  ),
                ),
                const SizedBox(width: AppSizes.taskTitleSpace),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSizes.taskTitleTextPaddingTop),
                      Text(
                        TaskText.taskTitleDefaultContentText,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.pureWhite87,
                        ),
                        maxLines: AppSizes.taskTitleTextMaxLine,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: AppSizes.taskTitleTextSpace),
                      Text(
                        TaskText.taskTitleDesciptText,
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(color: AppColors.grey),
                        maxLines: AppSizes.taskTitleTextMaxLine,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppSizes.taskTitleSpace),
                GestureDetector(
                  child: SizedBox(
                    width: AppSizes.taskTitleIconSize,
                    height: AppSizes.taskTitleIconSize,
                    child: Center(
                      child: Icon(
                        Icons.border_color_outlined,
                        color: AppColors.pureWhite87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.taskTitleToRowSpace),
            //Task Time Row
            TaskRowWidget(
              taskRowHeight: AppSizes.taskRowHeight,
              titleSpace: AppSizes.taskRowTitleSpace,
              titleText: TaskText.taskTimeText,
              detailWidth: AppSizes.taskRowTimeDetailWidth,
              detailBorderRadius: AppSizes.taskRowRadius,
              detailText: TaskText.taskDefaultTimeText,
              rowIcon: Icon(Icons.timer_outlined, color: AppColors.pureWhite87,),
            ),
            SizedBox(height: AppSizes.taskRowSpace),
            
            //Task Category Row
            TaskRowWidget(
              taskRowHeight: AppSizes.taskRowHeight,
              titleSpace: AppSizes.taskRowTitleSpace,
              titleText: TaskText.taskCategoryText,
              detailWidth: AppSizes.taskRowCategoryDetailWidth,
              detailBorderRadius: AppSizes.taskRowRadius,
              detailText: TaskText.taskDefaultCategoryText,
              rowIcon: Icon(Icons.sell_outlined, color: AppColors.pureWhite87,),
              iconSize: AppSizes.taskRowCategoryIconSize,
              detailColor: AppColors.royalBlue,
              detailSpace: AppSizes.taskRowCategoryDetailSpace,
            ),
            SizedBox(height: AppSizes.taskRowSpace),
            
            //Task Priority Row
            TaskRowWidget(
              taskRowHeight: AppSizes.taskRowHeight,
              titleSpace: AppSizes.taskRowTitleSpace,
              titleText: TaskText.taskPriorityText,
              detailWidth: AppSizes.taskRowPriorityDetailWidth,
              detailBorderRadius: AppSizes.taskRowRadius,
              detailText: TaskText.taskDefaultPriorityText,
              rowIcon: Icon(Icons.flag_outlined, color: AppColors.pureWhite87,),
            ),
            SizedBox(height: AppSizes.taskRowSpace),

            //Task Sub Row
            TaskRowWidget(
              taskRowHeight: AppSizes.taskRowHeight,
              titleSpace: AppSizes.taskRowTitleSpace,
              titleText: TaskText.taskSubText,
              detailWidth: AppSizes.taskRowSubDetailWidth,
              detailBorderRadius: AppSizes.taskAppBarIconRadius,
              detailText: TaskText.taskDefaultSubText,
              rowIcon: Icon(Icons.account_tree_outlined, color: AppColors.pureWhite87,),
            ),
            SizedBox(height: 28),

            //Delete Task Row
            Row(
              children: [
                Icon(Icons.delete_outline_rounded, color: AppColors.coralRed),
                SizedBox(width: 8),
                Text(
                  'Delete Task',
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(color: AppColors.coralRed),
                ),
              ],
            ),
            Expanded(child: Container()),

            //Button
            PrimaryButtonWidget(
              height: 48,
              text: 'Edit Task',
              width: double.infinity,
              onPressed: () {},
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
