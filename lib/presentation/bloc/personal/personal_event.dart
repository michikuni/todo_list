import 'package:flutter/material.dart';

abstract class PersonalEvent{}

class OnChangedLocale extends PersonalEvent {
  final Locale locale;
  OnChangedLocale(this.locale);
}

class OnChangedTheme extends PersonalEvent{}