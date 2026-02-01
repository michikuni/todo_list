import 'package:flutter/material.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';

abstract class HomeEvent {}

class GetProfileEvent extends HomeEvent{}

class OnContentChanged extends HomeEvent{
  final String content;
  OnContentChanged(this.content);
}

class OnDescriptionChanged extends HomeEvent{
  final String description;
  OnDescriptionChanged(this.description);
}

class OnDateChanged extends HomeEvent{
  final DateTime date;
  OnDateChanged(this.date);
}

class OnTimeChanged extends HomeEvent{
  final TimeOfDay time;
  OnTimeChanged(this.time);
}

class OnPriorityChanged extends HomeEvent{
  final int priority;
  OnPriorityChanged(this.priority);
}

class OnCategoryChanged extends HomeEvent{
  final Category catergory;
  OnCategoryChanged(this.catergory);
}

class OnSubmited extends HomeEvent{}

class GetTodoEvent extends HomeEvent{}

class ResetAddTodoEvent extends HomeEvent {}

class OnLoggingOut extends HomeEvent{}

class OnChangedCompletedStatus extends HomeEvent{
  final TodoWithKeyEntity todo;
  OnChangedCompletedStatus(this.todo);
}