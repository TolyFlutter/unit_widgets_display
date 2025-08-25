import 'dart:ui';

import 'package:flutter/material.dart';

abstract class DisplayAbility {
  String get appVersion;

  Color get randomColor;

  List<IconData> get myIcon;

  Future showAbout(BuildContext context);
}

class DisplayPlugin implements DisplayAbility {
  static final DisplayPlugin _instance = DisplayPlugin._internal();
  DisplayAbility? _displayAbility;

  DisplayPlugin._internal();

  factory DisplayPlugin() => _instance;

  void register(DisplayAbility ability) {
    _displayAbility = ability;
  }

  @override
  String get appVersion => _displayAbility?.appVersion ?? 'Unknown';

  @override
  Color get randomColor => _displayAbility?.randomColor ?? Colors.grey;

  @override
  List<IconData> get myIcon => _displayAbility?.myIcon ?? [];

  @override
  Future showAbout(BuildContext context) => 
      _displayAbility?.showAbout(context) ?? Future.value();
}
