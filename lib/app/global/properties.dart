import 'package:flutter/material.dart';

class AppProperties {
  static const String appName = 'Piero Angelo Morales Alcalde';
  static const String appVersion = '1.0.0';
  static const String appAuthor = 'Piero Morales Alcalde Team';
  static const String appLicense = 'MIT License';

  static const Duration themeAnimationDuration = Duration(seconds: 1);
  static const double responsiveBreakpoint = 800;
  static const EdgeInsetsGeometry mobilePadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 20,
  );
  static const EdgeInsetsGeometry desktopPadding = EdgeInsets.symmetric(
    horizontal: 50,
    vertical: 30,
  );
  static const double appBarHeight = 55;
  static const double homeIconSize = 40;
  static const double maxWidth = 1200;
  static const double carouselItemExtent = 300;

  static const Duration autoScrollDuration = Duration(seconds: 10);
  static const Duration transitionDuration = Duration(milliseconds: 800);
}
