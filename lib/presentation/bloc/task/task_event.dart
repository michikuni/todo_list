import 'package:flutter/material.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';

abstract class TaskEvent{}

class OnContentChanged extends TaskEvent{
  final String content;
  OnContentChanged(this.content);
}

class OnDesciptionChanged extends TaskEvent{
  final String description;
  OnDesciptionChanged(this.description);}

class OnDateChanged extends TaskEvent{
  final DateTime date;
  OnDateChanged(this.date);
}

class OnTimeChanged extends TaskEvent{
  final TimeOfDay time;
  OnTimeChanged(this.time);
}

class OnCategoryChanged extends TaskEvent{
  final Category category;
  OnCategoryChanged(this.category);
}

class OnPriorityChanged extends TaskEvent{
  final int priority;
  OnPriorityChanged(this.priority);
}

class LoadData extends TaskEvent{
  final int userId;
  final String email;
  final String name;
  final String avatar;
  LoadData(this.avatar, this.email, this.name, this.userId);
}

class OnDone extends TaskEvent{
  final bool isDone;
  OnDone(this.isDone);
}

class DeleteTask extends TaskEvent {
  final int id;
  DeleteTask (this.id);
}

class OnSubmit extends TaskEvent{
  final int id;
  OnSubmit(this.id);
}