import 'package:flutter/material.dart';

final kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(67, 93, 110, 220));
final myTheme = ThemeData().copyWith(
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.onPrimaryContainer,
    foregroundColor: kColorScheme.primaryContainer,
  ),
  // scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
);
