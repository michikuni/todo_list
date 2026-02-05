import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @homeAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Index'**
  String get homeAppBarTitle;

  /// No description provided for @homeEmptyContent.
  ///
  /// In en, this message translates to:
  /// **'What do you want to do today?'**
  String get homeEmptyContent;

  /// No description provided for @homeEmptyInstruction.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your tasks'**
  String get homeEmptyInstruction;

  /// No description provided for @dropDownCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get dropDownCompleted;

  /// No description provided for @dropDownUncompletedToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get dropDownUncompletedToday;

  /// No description provided for @dropDownUncompletedWeek.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get dropDownUncompletedWeek;

  /// No description provided for @dropDownUncompletedMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get dropDownUncompletedMonth;

  /// No description provided for @dropDownUncompletedAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get dropDownUncompletedAll;

  /// No description provided for @addTaskTitleText.
  ///
  /// In en, this message translates to:
  /// **'Add Task'**
  String get addTaskTitleText;

  /// No description provided for @addTaskContentHint.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get addTaskContentHint;

  /// No description provided for @addTaskDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get addTaskDescriptionHint;

  /// No description provided for @chooseCategoryTitleText.
  ///
  /// In en, this message translates to:
  /// **'Choose Category'**
  String get chooseCategoryTitleText;

  /// No description provided for @chooseCategorySaveButtonText.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get chooseCategorySaveButtonText;

  /// No description provided for @chooseCategoryCancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get chooseCategoryCancelButtonText;

  /// No description provided for @choosePriorityTitleText.
  ///
  /// In en, this message translates to:
  /// **'Task Priority'**
  String get choosePriorityTitleText;

  /// No description provided for @choosePrioritySaveButtonText.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get choosePrioritySaveButtonText;

  /// No description provided for @choosePriorityCancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get choosePriorityCancelButtonText;

  /// No description provided for @chooseTimeTitleText.
  ///
  /// In en, this message translates to:
  /// **'Choose Time'**
  String get chooseTimeTitleText;

  /// No description provided for @chooseTimeSaveButtonText.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get chooseTimeSaveButtonText;

  /// No description provided for @chooseTimeCancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get chooseTimeCancelButtonText;

  /// No description provided for @bottomBarIndexLabel.
  ///
  /// In en, this message translates to:
  /// **'Index'**
  String get bottomBarIndexLabel;

  /// No description provided for @bottomBarCalendarLabel.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get bottomBarCalendarLabel;

  /// No description provided for @bottomBarFocusLabel.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get bottomBarFocusLabel;

  /// No description provided for @bottomBarProfileLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get bottomBarProfileLabel;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for your task...'**
  String get searchHint;

  /// No description provided for @signinDialogTitleText.
  ///
  /// In en, this message translates to:
  /// **'Signin Failed'**
  String get signinDialogTitleText;

  /// No description provided for @signinDialogContentText.
  ///
  /// In en, this message translates to:
  /// **'Incorrect account or password'**
  String get signinDialogContentText;

  /// No description provided for @signinDialogButtonText.
  ///
  /// In en, this message translates to:
  /// **'OK!'**
  String get signinDialogButtonText;

  /// No description provided for @signinHeader.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get signinHeader;

  /// No description provided for @signinUsernameTitle.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get signinUsernameTitle;

  /// No description provided for @signinPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signinPasswordTitle;

  /// No description provided for @signinBottomTextButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get signinBottomTextButton;

  /// No description provided for @signinBottomText.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get signinBottomText;

  /// No description provided for @signinPrimaryButtonText.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get signinPrimaryButtonText;

  /// No description provided for @signinUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your Username'**
  String get signinUsernameHint;

  /// No description provided for @signinPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'● ● ● ● ● ● ● ● ● ● ● ●'**
  String get signinPasswordHint;

  /// No description provided for @signinEmailFail.
  ///
  /// In en, this message translates to:
  /// **'Email invalid!'**
  String get signinEmailFail;

  /// No description provided for @signinPasswordFail.
  ///
  /// In en, this message translates to:
  /// **'Password invalid!'**
  String get signinPasswordFail;

  /// No description provided for @signupHeader.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get signupHeader;

  /// No description provided for @signupUsernameTitle.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get signupUsernameTitle;

  /// No description provided for @signupPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signupPasswordTitle;

  /// No description provided for @signupConfirmPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get signupConfirmPasswordTitle;

  /// No description provided for @signupPrimaryButtonText.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get signupPrimaryButtonText;

  /// No description provided for @signupBottomText.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get signupBottomText;

  /// No description provided for @signupBottomTextButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get signupBottomTextButton;

  /// No description provided for @signupUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your Username'**
  String get signupUsernameHint;

  /// No description provided for @signupPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'● ● ● ● ● ● ● ● ● ● ● ●'**
  String get signupPasswordHint;

  /// No description provided for @signupEmailFail.
  ///
  /// In en, this message translates to:
  /// **'Email invalid!'**
  String get signupEmailFail;

  /// No description provided for @signupPasswordFail.
  ///
  /// In en, this message translates to:
  /// **'Password invalid!'**
  String get signupPasswordFail;

  /// No description provided for @signupConfirmPasswordFail.
  ///
  /// In en, this message translates to:
  /// **'Password not match!'**
  String get signupConfirmPasswordFail;

  /// No description provided for @signupDialogFailTitleText.
  ///
  /// In en, this message translates to:
  /// **'Signup Failed'**
  String get signupDialogFailTitleText;

  /// No description provided for @signupDialogFailContentText.
  ///
  /// In en, this message translates to:
  /// **'Information invalid'**
  String get signupDialogFailContentText;

  /// No description provided for @signupDialogButtonText.
  ///
  /// In en, this message translates to:
  /// **'OK!'**
  String get signupDialogButtonText;

  /// No description provided for @signupDialogSuccessTitleText.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get signupDialogSuccessTitleText;

  /// No description provided for @signupDialogSuccessContentText.
  ///
  /// In en, this message translates to:
  /// **'Signup Success!'**
  String get signupDialogSuccessContentText;

  /// No description provided for @deleteTaskTitleText.
  ///
  /// In en, this message translates to:
  /// **'Delete Task'**
  String get deleteTaskTitleText;

  /// No description provided for @deleteTaskContentText.
  ///
  /// In en, this message translates to:
  /// **'Are You sure you want to delete this task?\nTask title : '**
  String get deleteTaskContentText;

  /// No description provided for @deleteTaskCancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get deleteTaskCancelButtonText;

  /// No description provided for @deleteTaskDeleteButtonText.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteTaskDeleteButtonText;

  /// No description provided for @dateEditTimeButtonText.
  ///
  /// In en, this message translates to:
  /// **'Edit Time'**
  String get dateEditTimeButtonText;

  /// No description provided for @dateCancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get dateCancelButtonText;

  /// No description provided for @priorityTitleText.
  ///
  /// In en, this message translates to:
  /// **'Edit Task Priority'**
  String get priorityTitleText;

  /// No description provided for @priorityEditButtonText.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get priorityEditButtonText;

  /// No description provided for @priorityCancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get priorityCancelButtonText;

  /// No description provided for @editTitleText.
  ///
  /// In en, this message translates to:
  /// **'Edit Task Title'**
  String get editTitleText;

  /// No description provided for @editEditButtonText.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editEditButtonText;

  /// No description provided for @editCancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get editCancelButtonText;

  /// No description provided for @editContentHint.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get editContentHint;

  /// No description provided for @editDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get editDescriptionHint;

  /// No description provided for @editTimeTitleText.
  ///
  /// In en, this message translates to:
  /// **'Choose Time'**
  String get editTimeTitleText;

  /// No description provided for @editTimeEditButtonText.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editTimeEditButtonText;

  /// No description provided for @editTimeCancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get editTimeCancelButtonText;

  /// No description provided for @taskCategoryText.
  ///
  /// In en, this message translates to:
  /// **'Task Category:'**
  String get taskCategoryText;

  /// No description provided for @taskPriorityText.
  ///
  /// In en, this message translates to:
  /// **'Task Priority:'**
  String get taskPriorityText;

  /// No description provided for @taskSubText.
  ///
  /// In en, this message translates to:
  /// **'Sub - Task'**
  String get taskSubText;

  /// No description provided for @taskTimeText.
  ///
  /// In en, this message translates to:
  /// **'Task Time:'**
  String get taskTimeText;

  /// No description provided for @taskDeleteText.
  ///
  /// In en, this message translates to:
  /// **'Delete Task'**
  String get taskDeleteText;

  /// No description provided for @taskTitleDefaultContentText.
  ///
  /// In en, this message translates to:
  /// **'Do Math Homework'**
  String get taskTitleDefaultContentText;

  /// No description provided for @taskTitleDesciptText.
  ///
  /// In en, this message translates to:
  /// **'Do chapter 2 to 5 for next week'**
  String get taskTitleDesciptText;

  /// No description provided for @taskDefaultTimeText.
  ///
  /// In en, this message translates to:
  /// **'Today At 16:45'**
  String get taskDefaultTimeText;

  /// No description provided for @taskDefaultCategoryText.
  ///
  /// In en, this message translates to:
  /// **'University'**
  String get taskDefaultCategoryText;

  /// No description provided for @taskDefaultPriorityText.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get taskDefaultPriorityText;

  /// No description provided for @taskDefaultSubText.
  ///
  /// In en, this message translates to:
  /// **'Add Sub - Task'**
  String get taskDefaultSubText;

  /// No description provided for @taskButtonPrimaryText.
  ///
  /// In en, this message translates to:
  /// **'Edit Task'**
  String get taskButtonPrimaryText;

  /// No description provided for @categoryTaskTitleText.
  ///
  /// In en, this message translates to:
  /// **'Choose Category'**
  String get categoryTaskTitleText;

  /// No description provided for @categoryTaskCancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get categoryTaskCancelButtonText;

  /// No description provided for @categoryTaskDeleteButtonText.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get categoryTaskDeleteButtonText;

  /// No description provided for @chooseDateChooseTimeButtonText.
  ///
  /// In en, this message translates to:
  /// **'Choose Time'**
  String get chooseDateChooseTimeButtonText;

  /// No description provided for @chooseDateCancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get chooseDateCancelButtonText;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'MON'**
  String get monday;

  /// No description provided for @tueday.
  ///
  /// In en, this message translates to:
  /// **'TUE'**
  String get tueday;

  /// No description provided for @wedday.
  ///
  /// In en, this message translates to:
  /// **'WED'**
  String get wedday;

  /// No description provided for @thuday.
  ///
  /// In en, this message translates to:
  /// **'THU'**
  String get thuday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'FRI'**
  String get friday;

  /// No description provided for @satday.
  ///
  /// In en, this message translates to:
  /// **'SAT'**
  String get satday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'SUN'**
  String get sunday;

  /// No description provided for @janmonth.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get janmonth;

  /// No description provided for @febmonth.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get febmonth;

  /// No description provided for @marmonth.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get marmonth;

  /// No description provided for @aprmonth.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get aprmonth;

  /// No description provided for @maymonth.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get maymonth;

  /// No description provided for @junmonth.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get junmonth;

  /// No description provided for @julmonth.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get julmonth;

  /// No description provided for @augmonth.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get augmonth;

  /// No description provided for @sepmonth.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get sepmonth;

  /// No description provided for @octmonth.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get octmonth;

  /// No description provided for @novmonth.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get novmonth;

  /// No description provided for @decmonth.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get decmonth;

  /// No description provided for @categoryGrocery.
  ///
  /// In en, this message translates to:
  /// **'Grocery'**
  String get categoryGrocery;

  /// No description provided for @categoryWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get categoryWork;

  /// No description provided for @categorySport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get categorySport;

  /// No description provided for @categoryDesign.
  ///
  /// In en, this message translates to:
  /// **'Design'**
  String get categoryDesign;

  /// No description provided for @categoryUniversity.
  ///
  /// In en, this message translates to:
  /// **'University'**
  String get categoryUniversity;

  /// No description provided for @categorySocial.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get categorySocial;

  /// No description provided for @categoryMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get categoryMusic;

  /// No description provided for @categoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get categoryHealth;

  /// No description provided for @categoryMovie.
  ///
  /// In en, this message translates to:
  /// **'Movie'**
  String get categoryMovie;

  /// No description provided for @categoryHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get categoryHome;

  /// No description provided for @categoryCreateNew.
  ///
  /// In en, this message translates to:
  /// **'Create New'**
  String get categoryCreateNew;

  /// No description provided for @profileTitleText.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitleText;

  /// No description provided for @profileIdText.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get profileIdText;

  /// No description provided for @profileNameText.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get profileNameText;

  /// No description provided for @profileEmailText.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileEmailText;

  /// No description provided for @profileLanguageText.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profileLanguageText;

  /// No description provided for @profileSignoutText.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileSignoutText;

  /// No description provided for @profileDropdownEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get profileDropdownEn;

  /// No description provided for @profileDropdownVi.
  ///
  /// In en, this message translates to:
  /// **'Vietnamese'**
  String get profileDropdownVi;

  /// No description provided for @personalUpdateNameDialogPrimaryButton.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get personalUpdateNameDialogPrimaryButton;

  /// No description provided for @personalUpdateNameDialogSecondaryButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get personalUpdateNameDialogSecondaryButton;

  /// No description provided for @personalUpdateNameDialogTextHint.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get personalUpdateNameDialogTextHint;

  /// No description provided for @personalUpdateNameDialogTitleText.
  ///
  /// In en, this message translates to:
  /// **'Change Name'**
  String get personalUpdateNameDialogTitleText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
