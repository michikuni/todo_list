import 'package:flutter/material.dart';

abstract class PersonalState {
  final Locale locale;
  final bool status;

  const PersonalState({
    required this.locale,
    this.status = false,
  });
}

class PersonalInitial extends PersonalState {
  const PersonalInitial() : super(locale: const Locale('en'));
}
class LocaleChangedState extends PersonalState {
  const LocaleChangedState(Locale locale, bool status) : super(locale: locale, status: status);
}

class ThemeChangedState extends PersonalState {
  const ThemeChangedState({
    required super.locale,
    required super.status,
  });
}