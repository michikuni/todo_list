import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/presentation/bloc/task/task_bloc.dart';
import 'package:todo_list/presentation/bloc/task/task_event.dart';
import 'package:todo_list/presentation/bloc/task/task_state.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class EditTimeDialog extends StatefulWidget {
  const EditTimeDialog({super.key});

  @override
  State<EditTimeDialog> createState() => _EditTimeDialogState();
}

class _EditTimeDialogState extends State<EditTimeDialog> {
  int hour = 8;
  int minute = 20;
  bool isAm = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) => Dialog(
        backgroundColor: AppColors.darkGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.chooseTimeDialogPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose Time',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.pureWhite87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Divider(color: AppColors.mediumGrey),

              const SizedBox(
                height: AppSizes.chooseTimeDialogDivideSpaceBottom,
              ),

              /// TIME PICKER
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _numberPicker(
                    value: hour,
                    min: 1,
                    max: 12,
                    onChanged: (v) => setState(() => hour = v),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          AppSizes.chooseTimeDialogColonPaddingHorizontal,
                    ),
                    child: SvgPicture.asset('assets/icons/colon.svg'),
                  ),
                  _numberPicker(
                    value: minute,
                    min: 0,
                    max: 59,
                    padZero: true,
                    onChanged: (v) => setState(() => minute = v),
                  ),
                  SizedBox(
                    width: AppSizes.chooseTimeDialogColonPaddingHorizontal,
                  ),
                  _amPmPicker(),
                ],
              ),

              SizedBox(height: AppSizes.chooseTimeDialogButtonSpaceTop),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.chooseTimeDialogButtonPaddingHorizontal,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: SizedBox(
                          height: AppSizes.chooseTimeDialogButtonHeight,
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
                      height: AppSizes.chooseTimeDialogButtonHeight,
                      text: 'Edit',
                      width: AppSizes.chooseTimeDialogPrimaryButtonWidth,
                      onPressed: () {
                        final time = TimeOfDay(
                          hour: isAm ? hour % 12 : hour + 12,
                          minute: minute,
                        );
                        final minutes = time.hour * 60 + time.minute;

                        context.read<TaskBloc>().add(OnTimeChanged(minutes));
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _numberPicker({
    required int value,
    required int min,
    required int max,
    required ValueChanged<int> onChanged,
    bool padZero = false,
  }) {
    final controller = FixedExtentScrollController(initialItem: value - min);

    return Container(
      width: AppSizes.chooseTimeDialogTimeSize,
      height: AppSizes.chooseTimeDialogTimeSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppSizes.chooseTimeDialogTimeRadius,
        ),
        color: AppColors.jetBlack,
      ),
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 24,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          onChanged(index + min);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: max - min + 1,
          builder: (_, index) {
            final val = index + min;
            final isSelected = val == value;

            return Center(
              child: Transform.scale(
                scale: isSelected ? 1.5 : 1.0,
                child: Text(
                  padZero ? val.toString().padLeft(2, '0') : '$val',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    height: 1,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? AppColors.pureWhite87
                        : AppColors.pureWhite10,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _amPmPicker() {
    return Container(
      width: AppSizes.chooseTimeDialogTimeSize,
      height: AppSizes.chooseTimeDialogTimeSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppSizes.chooseTimeDialogTimeRadius,
        ),
        color: AppColors.jetBlack,
      ),
      child: ListWheelScrollView(
        itemExtent: 24,
        physics: const FixedExtentScrollPhysics(),
        controller: FixedExtentScrollController(initialItem: isAm ? 0 : 1),
        onSelectedItemChanged: (index) {
          setState(() => isAm = index == 0);
        },
        children: [_amPmItem('AM', isAm), _amPmItem('PM', !isAm)],
      ),
    );
  }

  Widget _amPmItem(String text, bool selected) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          height: 1,
          fontWeight: FontWeight.w600,
          color: selected ? AppColors.pureWhite87 : AppColors.pureWhite10,
        ),
      ),
    );
  }
}
