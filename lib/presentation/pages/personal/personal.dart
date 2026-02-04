import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/presentation/bloc/gate/auth_bloc.dart';
import 'package:todo_list/presentation/bloc/gate/auth_event.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';
import 'package:todo_list/presentation/pages/personal/components/language_dropdown.dart';

class PersonalWidget extends StatelessWidget {
  const PersonalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          title: Text('Profile', style: Theme.of(context).textTheme.bodyMedium),
          centerTitle: true,
          backgroundColor: AppColors.black,
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: CircleAvatar(
                      radius: 52,
                      child: Image.network(state.avatar),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Icon(
                    Icons.verified_user_outlined,
                    color: AppColors.pureWhite87,
                  ),
                  SizedBox(width: AppSizes.taskRowTitleSpace),
                  Text(
                    'ID',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.pureWhite87,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    state.id.toString(),
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.pureWhite87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Icon(
                    Icons.perm_identity,
                    color: AppColors.pureWhite87,
                  ),
                  SizedBox(width: AppSizes.taskRowTitleSpace),
                  Text(
                    'Name',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.pureWhite87,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    state.name,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.pureWhite87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: AppColors.pureWhite87,
                  ),
                  SizedBox(width: AppSizes.taskRowTitleSpace),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.pureWhite87,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    state.email,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.pureWhite87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  context.read<AuthBloc>().add(AuthLoggedOut());
                },
                child: Row(
                  children: [
                    Icon(Icons.language_rounded, color: AppColors.pureWhite87),
                    SizedBox(width: AppSizes.taskRowTitleSpace),
                    Text(
                      'Language',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: AppColors.pureWhite87,
                      ),
                    ),
                    Expanded(child: Container()),
                    LanguageDropdown(
                      onChanged: (value) {
                        switch (value) {
                          case LanguageDropdownValue.english:
                            context.read<AuthBloc>().add(
                              OnChangedLocale(Locale('en')),
                            );
                          case LanguageDropdownValue.vietnamese:
                            context.read<AuthBloc>().add(
                              OnChangedLocale(Locale('vi')),
                            );
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  context.read<AuthBloc>().add(AuthLoggedOut());
                },
                child: Row(
                  children: [
                    Icon(Icons.logout, color: AppColors.coralRed),
                    SizedBox(width: AppSizes.taskRowTitleSpace),
                    Text(
                      'Log out',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: AppColors.coralRed,
                      ),
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
}
