import 'package:flutter/material.dart';

abstract class AuthEvent {}

class AuthCheckEvent extends AuthEvent {}

class AuthLoggedIn extends AuthEvent {}

class AuthLoggedOut extends AuthEvent {}

class OnChangedLocale extends AuthEvent {
  final Locale locale;
  OnChangedLocale(this.locale);
}