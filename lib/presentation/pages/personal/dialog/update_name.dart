import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/l10n/app_localizations.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';
import 'package:todo_list/presentation/widgets/loading_dialog.dart';
import 'package:todo_list/presentation/widgets/primary_button.dart';

class UpdateNameDialog extends StatefulWidget {
  const UpdateNameDialog({super.key, required this.oldName});
  final String oldName;

  @override
  State<UpdateNameDialog> createState() => _UpdateNameDialogState();
}

class _UpdateNameDialogState extends State<UpdateNameDialog> {
  late TextEditingController nameTextController;
  @override
  void dispose() {
    super.dispose();
    nameTextController.dispose();
  }
  @override
  void initState() {
    super.initState();
    nameTextController = TextEditingController(text: widget.oldName);
  }
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if(state.status == FormzSubmissionStatus.inProgress){
          showDialog(context: context, builder: 
          (context) => const LoadingDialog(),);
          context.pop();
        }
        if(state.status == FormzSubmissionStatus.success){
          Navigator.pop(context);
        }
      },
      builder: (context, state) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.signupDialogRadius),
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          padding: EdgeInsets.all(AppSizes.signupDialogPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                l10n.personalUpdateNameDialogTitleText,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSizes.signupDialogDivideSpaceTop),
              Divider(height: 1),
              const SizedBox(height: AppSizes.signupDialogDivideSpaceBottom),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppSizes.editTaskDialogInputMarginHorizontal,
                  vertical: AppSizes.editTaskDialogInputMarginVertical,
                ),
                decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppSizes.editTaskDialogRadius,
                        ),
                      ),
                height: AppSizes.editTaskDialogInputHeight,
                padding: EdgeInsets.symmetric(horizontal: AppSizes.editTaskDialogInputPaddingHorizontal),
                child: TextFormField(
                  expands: false,
                  scrollPadding: EdgeInsets.zero,
                  textAlignVertical: TextAlignVertical.center,
                  maxLines: 1,
                  controller: nameTextController,
                  decoration: InputDecoration(
                    hintText: l10n.personalUpdateNameDialogTextHint,
                    hintStyle: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.secondaryFixedDim),
                    border: InputBorder.none,
                  ),
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              SizedBox(height: AppSizes.signupDialogContentSpaceBottom),
              Row(
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
                            l10n.personalUpdateNameDialogSecondaryButton,
                            style: Theme.of(context).textTheme.displayLarge
                                ?.copyWith(color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: PrimaryButtonWidget(
                      isValid: true,
                      height: AppSizes.signupDialogButtonHeight,
                      text: l10n.personalUpdateNameDialogPrimaryButton,
                      width: AppSizes.signupDialogButtonWidth,
                      onPressed: () {
                        context.read<HomeBloc>().add(UpdateNameProfileEvent(nameTextController.text));
                      },
                    ),
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
