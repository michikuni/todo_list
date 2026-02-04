import 'package:flutter/material.dart';

abstract class AuthState {
  final Locale locale;
  const AuthState({required this.locale});
}

class AuthInitial extends AuthState {
  const AuthInitial() : super(locale: const Locale('en'));
}

class AuthLoading extends AuthState {
  const AuthLoading({required super.locale});
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({required super.locale});
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated({required super.locale});
}

class LocaleChangedState extends AuthState {
  const LocaleChangedState(Locale locale) : super(locale: locale);
}
