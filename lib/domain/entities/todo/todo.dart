
class TodoEntity{
  String content;
  String description;
  DateTime date;
  int minutes;
  String category;
  int priority;
  int userId;
  String email;
  String name;
  String avatar;

  TodoEntity({
    required this.content, 
    required this.description,
    required this.category,
    required this.priority,
    required this.date,
    required this.minutes,
    required this.userId,
    required this.email,
    required this.name,
    required this.avatar
  });
}