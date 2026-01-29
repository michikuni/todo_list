import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String content;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  int minutes;

  @HiveField(4)
  String categoryName;

  @HiveField(5)
  int priority;

  @HiveField(6)
  int userId;

  @HiveField(7)
  String email;

  @HiveField(8)
  String name;

  @HiveField(9)
  String avatar;

  @HiveField(10)
  int categoryColor;

  @HiveField(11)
  String categoryIcon;

  @HiveField(12)
  bool isDone;

  TodoModel({
    required this.content, 
    required this.description,
    required this.categoryName,
    required this.categoryColor,
    required this.categoryIcon,
    required this.priority,
    required this.date,
    required this.minutes,
    required this.userId,
    required this.email,
    required this.name,
    required this.avatar,
    required this.isDone
  });
}
