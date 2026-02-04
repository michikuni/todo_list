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
    decmonth
  ];
}