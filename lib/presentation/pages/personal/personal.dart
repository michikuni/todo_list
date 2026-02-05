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
import 'package:todo_list/presentation/bloc/personal/personal_bloc.dart';
import 'package:todo_list/presentation/bloc/personal/personal_event.dart';
import 'package:todo_list/presentation/bloc/personal/personal_state.dart';
import 'package:todo_list/presentation/pages/personal/components/language_dropdown.dart';
import 'package:todo_list/presentation/pages/personal/dialog/update_name.dart';

class PersonalWidget extends StatefulWidget {
  const PersonalWidget({super.key});

  @override
  State<PersonalWidget> createState() => _PersonalWidgetState();
}

class _PersonalWidgetState extends State<PersonalWidget> {
  @override
  Widget build(BuildContext context) {
    return const _PersonalView();
  }
}

class _PersonalView extends StatelessWidget {
  const _PersonalView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final WidgetStateProperty<Color?> overlayColor =
        WidgetStateProperty<Color?>.fromMap(<WidgetState, Color>{
          WidgetState.selected: Color(0xFFFF877D).withValues(alpha: 0.54),
          WidgetState.disabled: Colors.grey.shade400,
        });
    const WidgetStateProperty<Color?> trackColor =
        WidgetStateProperty<Color?>.fromMap(<WidgetStatesConstraint, Color>{
          WidgetState.selected: Color(0xFFFF877D),
        });
    return BlocBuilder<PersonalBloc, PersonalState>(
      builder: (context, state) {
        return Scaffold(
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
                        child: Image.network(
                          context.select((HomeBloc bloc) => bloc.state.avatar),
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.account_circle_rounded,
                              size: 104,
                            );
                          },
                        ),
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
                      context.select(
                        (HomeBloc bloc) => bloc.state.id.toString(),
                      ),
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Icon(
                      Icons.perm_identity,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    SizedBox(width: AppSizes.taskRowTitleSpace),
                    Text(
                      l10n.profileNameText,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      context.select((HomeBloc bloc) => bloc.state.name),
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
                              child: UpdateNameDialog(
                                oldName: context.select(
                                  (HomeBloc bloc) => bloc.state.name,
                                ),
                              ),
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
                    Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    SizedBox(width: AppSizes.taskRowTitleSpace),
                    Text(
                      l10n.profileEmailText,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      context.select((HomeBloc bloc) => bloc.state.email),
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
                      Icon(
                        Icons.language_rounded,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      SizedBox(width: AppSizes.taskRowTitleSpace),
                      Text(
                        l10n.profileLanguageText,
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      Expanded(child: Container()),
                      LanguageDropdown(
                        locale: context.select(
                          (PersonalBloc bloc) => bloc.state.locale,
                        ),
                        onChanged: (value) {
                          switch (value) {
                            case LanguageDropdownValue.english:
                              context.read<PersonalBloc>().add(
                                OnChangedLocale(Locale('en')),
                              );
                            case LanguageDropdownValue.vietnamese:
                              context.read<PersonalBloc>().add(
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
                      Icon(
                        Icons.format_paint_outlined,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      SizedBox(width: AppSizes.taskRowTitleSpace),
                      Text(
                        'Theme',
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      Expanded(child: Container()),
                      Switch(
                        value: context.select(
                          (PersonalBloc bloc) => bloc.state.status,
                        ),
                        overlayColor: overlayColor,
                        thumbColor: const WidgetStatePropertyAll<Color>(
                          Color(0xFFFFFFFF),
                        ),
                        // trackColor: const WidgetStatePropertyAll<Color>(
                        //   Color(0xFFFF877D),
                        trackColor: trackColor,
                        onChanged: (value) {
                          context.read<PersonalBloc>().add(OnChangedTheme());
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
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(color: AppColors.coralRed),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
