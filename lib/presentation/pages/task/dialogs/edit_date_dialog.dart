import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/l10n/app_localizations.dart';
import 'package:todo_list/presentation/bloc/task/task_bloc.dart';
import 'package:todo_list/presentation/bloc/task/task_event.dart';
import 'package:todo_list/presentation/bloc/task/task_state.dart';
import 'package:todo_list/presentation/pages/task/dialogs/edit_time_dialog.dart';
import 'package:todo_list/presentation/utils/extension_localizations.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class EditDateDialog extends StatefulWidget {
  const EditDateDialog({super.key});

  @override
  State<EditDateDialog> createState() => _EditDateDialogState();
}

class _EditDateDialogState extends State<EditDateDialog> {
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final days = l10n.weekDaysName;
    final months = l10n.monthDaysName;
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) => Dialog(
        backgroundColor: AppColors.darkGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.chooseDateDialogPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _header(months),
              const Divider(height: 1,),
              _weekDays(days),
              const SizedBox(
                height: AppSizes.chooseDateDialogWeekPaddingBottom,
              ),
              _calendar(),
              const SizedBox(
                height: AppSizes.chooseDateDialogCalendarPaddingBottom,
              ),
              _actions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(List<String> months) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left, color: AppColors.pureWhite87),
          onPressed: _previousMonth,
        ),
        Center(
          child: Column(
            children: [
              Text(
                _monthName(currentDate.month, months).toUpperCase(),
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.pureWhite87,
                ),
              ),
              Text(
                currentDate.year.toString(),
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right, color: AppColors.pureWhite),
          onPressed: _nextMonth,
        ),
      ],
    );
  }

  Widget _weekDays(List<String> days) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((e) {
        return Padding(
          padding: const EdgeInsets.all(AppSizes.chooseDateDialogWeekPadding),
          child: Text(
            e,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color:
                  e == days[0] ||
                      e == days[6]
                  ? AppColors.coralRed
                  : AppColors.pureWhite87,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _calendar() {
    final daysInMonth = _daysInMonth(currentDate);
    final leadingEmpty = _leadingEmptyDays(currentDate);
    final totalItems = leadingEmpty + daysInMonth;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: totalItems,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: AppSizes.chooseDateDialogCalendarItemSpace,
        mainAxisSpacing: AppSizes.chooseDateDialogCalendarItemSpace,
      ),
      itemBuilder: (_, index) {
        if (index < leadingEmpty) {
          return const SizedBox();
        }

        final day = index - leadingEmpty + 1;

        final isSelected =
            selectedDate.year == currentDate.year &&
            selectedDate.month == currentDate.month &&
            selectedDate.day == day;

        return GestureDetector(
          onTap: () {
            setState(() {
              final date = DateTime(currentDate.year, currentDate.month, day);
              selectedDate = date;
              context.read<TaskBloc>().add(OnDateChanged(date));
            });
          },
          child: Container(
            width: AppSizes.chooseDateDialogCalendarItemSize,
            height: AppSizes.chooseDateDialogCalendarItemSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.mediumSlateBlue
                  : AppColors.jetBlack,
              borderRadius: BorderRadius.circular(
                AppSizes.chooseDateDialogCalendarItemRadius,
              ),
            ),
            margin: EdgeInsets.all(AppSizes.chooseDateDialogCalendarItemMargin),
            child: Text(
              '$day',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: AppColors.pureWhite87,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _actions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: SizedBox(
              height: AppSizes.chooseDateDialogButtonHeight,
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.dateCancelButtonText,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.mediumSlateBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
        PrimaryButtonWidget(
          isValid: true,
          height: AppSizes.chooseDateDialogButtonHeight,
          text: AppLocalizations.of(context)!.dateEditTimeButtonText,
          width: AppSizes.chooseDateDialogPrimaryButtonWidth,
          onPressed: () {
            context.pop();
            final taskBloc = context.read<TaskBloc>();
            showDialog(
              context: context,
              builder: (context) {
                return BlocProvider.value(
                  value: taskBloc,
                  child: EditTimeDialog(),
                );
              },
            );
          },
        ),
      ],
    );
  }

  void _previousMonth() {
    setState(() {
      currentDate = DateTime(
        currentDate.month == 1 ? currentDate.year - 1 : currentDate.year,
        currentDate.month == 1 ? 12 : currentDate.month - 1,
      );
    });
  }

  void _nextMonth() {
    setState(() {
      currentDate = DateTime(
        currentDate.month == 12 ? currentDate.year + 1 : currentDate.year,
        currentDate.month == 12 ? 1 : currentDate.month + 1,
      );
    });
  }

  int _daysInMonth(DateTime date) {
    final firstDayNextMonth = DateTime(date.year, date.month + 1, 1);
    return firstDayNextMonth.subtract(const Duration(days: 1)).day;
  }

  String _monthName(int month, List<String> months) {
    return months[month - 1];
  }

  int _leadingEmptyDays(DateTime date) {
    final firstWeekday = _firstWeekdayOfMonth(date);
    return firstWeekday % 7;
  }

  int _firstWeekdayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1).weekday;
  }
}
