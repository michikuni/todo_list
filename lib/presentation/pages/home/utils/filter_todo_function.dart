import 'package:todo_list/domain/entities/todo/todo_with_key.dart';
import 'package:todo_list/presentation/pages/home/components/dropdown_button.dart';

List<TodoWithKeyEntity> filterTodos({
  required List<TodoWithKeyEntity> list,
  required TimeFilter timeFilter,
  required String searchText,
}) {
  final now = DateTime.now();
  final keyword = searchText.trim().toLowerCase();

  return list.where((item) {
    final todo = item.todo;
    final date = todo.date;

    bool matchTime = true;

    switch (timeFilter) {
      case TimeFilter.today:
        matchTime = date.year == now.year &&
            date.month == now.month &&
            date.day == now.day;
        break;

      case TimeFilter.week:
        final startOfWeek =
            DateTime(now.year, now.month, now.day)
                .subtract(Duration(days: now.weekday - 1));
        final endOfWeek = startOfWeek.add(const Duration(days: 7));

        matchTime =
            date.isAfter(startOfWeek) &&
            date.isBefore(endOfWeek);
        break;

      case TimeFilter.month:
        matchTime =
            date.year == now.year &&
            date.month == now.month;
        break;

      case TimeFilter.all:
        matchTime = true;
        break;
    }

    if (!matchTime) return false;
    if (keyword.isEmpty) return true;

    return todo.content.toLowerCase().contains(keyword) ||
        todo.description.toLowerCase().contains(keyword);
  }).toList();
}


String formatDateWithMinutes(DateTime date, int minutes) {
  final now = DateTime.now();

  final isToday =
      date.year == now.year &&
      date.month == now.month &&
      date.day == now.day;

  final h = minutes ~/ 60;
  final m = minutes % 60;

  final hh = h.toString().padLeft(2, '0');
  final mm = m.toString().padLeft(2, '0');

  if (isToday) {
    return 'Today At $hh:$mm';
  }

  final dd = date.day.toString().padLeft(2, '0');
  final MM = date.month.toString().padLeft(2, '0');
  final yyyy = date.year.toString();

  return '$dd/$MM/$yyyy At $hh:$mm';
}

int handlerPmHour(int hour){
  if(hour == 12){
    return 0;
  } else {
    return hour + 12;
  }
}