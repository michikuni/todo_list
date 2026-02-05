import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/constants/app_sizes.dart';
import 'package:todo_list/core/constants/assets_path.dart';
import 'package:todo_list/l10n/app_localizations.dart';
import 'package:todo_list/presentation/bloc/gate/auth_bloc.dart';
import 'package:todo_list/presentation/bloc/gate/auth_event.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';
import 'package:todo_list/presentation/pages/personal/components/language_dropdown.dart';
import 'package:todo_list/presentation/pages/personal/dialog/update_name.dart';

class PersonalWidget extends StatelessWidget {
  const PersonalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: AppBar(
          title: Text(
            l10n.profileTitleText,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  SizedBox(width: AppSizes.taskRowTitleSpace),
                  Text(
                    l10n.profileIdText,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    state.id.toString(),
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Icon(Icons.perm_identity, color: Theme.of(context).colorScheme.onPrimary),
                  SizedBox(width: AppSizes.taskRowTitleSpace),
                  Text(
                    l10n.profileNameText,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    state.name,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(width: 12),
                  IconButton(
                    icon: SvgPicture.asset(AssetsPath.editIcon),
                    onPressed: () {
                      final homeBloc = context.read<HomeBloc>();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: homeBloc,
                            child: UpdateNameDialog(oldName: state.name),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Icon(Icons.email_outlined, color: Theme.of(context).colorScheme.onPrimary),
                  SizedBox(width: AppSizes.taskRowTitleSpace),
                  Text(
                    l10n.profileEmailText,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    state.email,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
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
                    Icon(Icons.language_rounded, color: Theme.of(context).colorScheme.onPrimary),
                    SizedBox(width: AppSizes.taskRowTitleSpace),
                    Text(
                      l10n.profileLanguageText,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Expanded(child: Container()),
                    LanguageDropdown(
                      locale: context.select(
                        (AuthBloc bloc) => bloc.state.locale,
                      ),
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
                      l10n.profileSignoutText,
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
