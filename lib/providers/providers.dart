import 'package:book/providers/settings_provider.dart';
import 'package:book/providers/themes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart';
ChangeNotifierProvider<T> buildProvider<T extends ChangeNotifier>(T value){
  return ChangeNotifierProvider<T>.value(value: value);
}


List<Widget> get providers => _providers;

final _providers = [
  buildProvider<SettingsProvider>(SettingsProvider()),
  buildProvider<ThemesProvider>(ThemesProvider()),
];
