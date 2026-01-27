import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/presentation/pages/home/choose_category_dialog.dart';
import 'package:todo_list/presentation/pages/home/date_picker_dialog.dart';
import 'package:todo_list/presentation/pages/home/priority_dialog.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  bool contentSelected = true;
  bool descriptSelected = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1),
          color: AppColors.darkGrey,
        ),
        padding: EdgeInsets.all(24),
        height: 240,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Task',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.pureWhite87,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12),
            Container(
              decoration: contentSelected
                  ? BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.mediumGrey),
                      borderRadius: BorderRadius.circular(4),
                    )
                  : null,
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: contentSelected ? 16 : 0,
                vertical: 8,
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    contentSelected = true;
                    descriptSelected = false;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Content',
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.grey),
                  border: InputBorder.none,
                ),
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.pureWhite87),
              ),
            ),
            SizedBox(height: 12),

            Container(
              decoration: descriptSelected
                  ? BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.mediumGrey),
                      borderRadius: BorderRadius.circular(4),
                    )
                  : null,
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: descriptSelected ? 16 : 0,
                vertical: 8,
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    contentSelected = false;
                    descriptSelected = true;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Description',
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.grey),
                  border: InputBorder.none,
                ),
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.pureWhite87),
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const DatePickerDialogCustom(),
                    );
                  },
                  icon: Icon(
                    Icons.timer_outlined,
                    color: AppColors.pureWhite87,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context) => const ChooseCategoryDialog(),);
                  },
                  icon: Icon(Icons.sell_outlined, color: AppColors.pureWhite87),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const PriorityDialog(),
                    );
                  },
                  icon: Icon(Icons.flag_outlined, color: AppColors.pureWhite87),
                ),
                Expanded(child: Container()),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/send.svg'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
