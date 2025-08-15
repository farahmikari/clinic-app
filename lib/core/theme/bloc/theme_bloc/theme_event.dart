import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}
class GetCurrentThemeEvent extends ThemeEvent {}


class ChangeThemeEvent extends ThemeEvent {
  final ThemeData myThemes;

  const ChangeThemeEvent({required this.myThemes});

  @override
  List<Object> get props => [myThemes];
}