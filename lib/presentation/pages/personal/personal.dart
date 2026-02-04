import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/presentation/bloc/gate/auth_bloc.dart';
import 'package:todo_list/presentation/bloc/gate/auth_event.dart';
import 'package:todo_list/presentation/bloc/home/home_bloc.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';

class PersonalWidget extends StatelessWidget {
  const PersonalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          title: Text('Profile', style: Theme.of(context).textTheme.bodyLarge),
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
              SizedBox(height: 16),
              Text('Name: ${state.name}'),
              Text('Email: ${state.email}'),
              SizedBox(height: 12),
              Container(
                height: 32,
                color: AppColors.darkGrey,
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                child: GestureDetector(onTap: () {
                  context.read<AuthBloc>().add(OnChangedLocale(Locale('en')));
                }, child: Text('Switch to English')),
              ),
              Container(
                height: 32,
                color: AppColors.darkGrey,
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 12),
                child: GestureDetector(
                  onTap: () {
                    context.read<AuthBloc>().add(OnChangedLocale(Locale('vi')));
                  }, child: Text('Switch to Vietnamese')),
              ),
              Container(
                height: 32,
                color: AppColors.darkGrey,
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                child: GestureDetector(onTap: () {
                  context.read<AuthBloc>().add(AuthLoggedOut());
                }, child: Text('Log out')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
