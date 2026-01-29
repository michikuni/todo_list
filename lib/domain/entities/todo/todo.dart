class TodoEntity {
  String content;
  String description;
  DateTime date;
  int minutes;
  Category category;
  int priority;
  int userId;
  String email;
  String name;
  String avatar;
  bool isDone;

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
    required this.avatar,
    required this.isDone
  });
}

class Category {
  final String name;
  final int color;
  final String icon;
  const Category({required this.name, required this.color, required this.icon});
}


