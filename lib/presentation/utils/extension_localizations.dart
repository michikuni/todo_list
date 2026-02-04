import 'package:todo_list/l10n/app_localizations.dart';

extension AppText on AppLocalizations {
  List<String> get weekDaysName => [
    sunday,
    monday,
    tueday,
    wedday,
    thuday,
    friday,
    satday,
  ];

  List<String> get monthDaysName => [
    janmonth,
    febmonth,
    marmonth,
    aprmonth,
    marmonth,
    junmonth,
    julmonth,
    augmonth,
    sepmonth,
    octmonth,
    novmonth,
    decmonth,
  ];

  String categoryName(String type) {
    switch (type) {
      case 'grocery':
        return categoryGrocery;
      case 'work':
        return categoryWork;
      case 'sport':
        return categorySport;
      case 'design':
        return categoryDesign;
      case 'university':
        return categoryUniversity;
      case 'social':
        return categorySocial;
      case 'music':
        return categoryMusic;
      case 'health':
        return categoryHealth;
      case 'movie':
        return categoryMovie;
      case 'home':
        return categoryHome;
      case 'createnew':
        return categoryCreateNew;
      default:
        return type;
    }
  }
}
