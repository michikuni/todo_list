import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';
import 'package:todo_list/presentation/pages/home/dialogs/choose_category_dialog.dart';
import 'package:todo_list/presentation/pages/home/dialogs/choose_date_dialog.dart';
import 'package:todo_list/presentation/pages/home/dialogs/choose_priority_dialog.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  late TextEditingController contentTextController;
  late TextEditingController descriptionTextController;
  bool contentSelected = true;
  bool descriptSelected = false;

  @override
  void initState() {
    super.initState();
    contentTextController = TextEditingController();
    descriptionTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        log(state.status.name);
        if(contentTextController.text != state.content){
          contentTextController.text = state.content;
        }
        if(descriptionTextController.text != state.description){
          descriptionTextController.text = state.description;
        }
        if(state.status == FormzSubmissionStatus.success){
          context.pop();
        }
      },
      child: Dialog(
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
                        border: Border.all(
                          width: 1,
                          color: AppColors.mediumGrey,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      )
                    : null,
                height: 40,
                padding: EdgeInsets.symmetric(
                  horizontal: contentSelected ? 16 : 0,
                  vertical: 8,
                ),
                child: TextFormField(
                  controller: contentTextController,
                  onTap: () {
                    setState(() {
                      contentSelected = true;
                      descriptSelected = false;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      context.read<HomeBloc>().add(OnContentChanged(value));
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
                        border: Border.all(
                          width: 1,
                          color: AppColors.mediumGrey,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      )
                    : null,
                height: 40,
                padding: EdgeInsets.symmetric(
                  horizontal: descriptSelected ? 16 : 0,
                  vertical: 8,
                ),
                child: TextFormField(
                  controller: descriptionTextController,
                  onTap: () {
                    setState(() {
                      contentSelected = false;
                      descriptSelected = true;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      context.read<HomeBloc>().add(OnDescriptionChanged(value));
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
                      final homeBloc = context.read<HomeBloc>();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: homeBloc,
                            child: ChooseDateDialog(),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.timer_outlined,
                      color: AppColors.pureWhite87,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final homeBloc = context.read<HomeBloc>();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: homeBloc,
                            child: ChooseCategoryDialog(),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.sell_outlined,
                      color: AppColors.pureWhite87,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final homeBloc = context.read<HomeBloc>();
                      showDialog(
                        context: context,
                        builder: (context) => BlocProvider.value(
                          value: homeBloc,
                          child: ChoosePriorityDialog(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.flag_outlined,
                      color: AppColors.pureWhite87,
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(OnSubmited());
                    },
                    icon: SvgPicture.asset('assets/icons/send.svg'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
