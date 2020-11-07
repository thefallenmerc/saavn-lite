import 'dart:math';

import 'package:flutter/material.dart';
part 'extensions.dart';
part 'light_color.dart';
part 'dark_color.dart';

enum ThemeType { LIGHT, DARK }

class AppTheme {
  static ThemeData get lightTheme => ThemeData.light().copyWith(
        brightness: Brightness.light,
        primaryColor: ThemeColorsLight.primary,
        accentColor: ThemeColorsLight.accentColor,
        primaryColorLight: ThemeColorsLight.primaryLight,
        buttonColor: ThemeColorsLight.primary,
        backgroundColor: ThemeColorsLight.background,
        cardColor: ThemeColorsLight.cardColor,
        iconTheme: IconThemeData(color: ThemeColorsLight.gray),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
            surface: ThemeColorsLight.surfaceColor,
            onSurface: ThemeColorsLight.onSurfaceDarkColor,
            onPrimary: ThemeColorsLight.onPrimary,
            onSecondary: ThemeColorsLight.onPrimary,
            onBackground: ThemeColorsLight.onSurfaceLightColor),
        // textTheme: TextThemes.lightTextTheme,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: ThemeColorsLight.appBarColor,
          elevation: 1,
          textTheme: TextTheme(
            headline6: TextStyle(color: ThemeColorsLight.black, fontSize: 20),
          ),
          iconTheme: IconThemeData(
            color: ThemeColorsLight.black,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
    accentColor: ThemeColorsDark.accentColor,
    primaryColor: ThemeColorsDark.primaryColor
  );

  static BoxDecoration outline(context) => BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Theme.of(context).dividerColor, width: 2),
      );
  static BoxDecoration outlinePrimary(context) => BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Theme.of(context).primaryColor, width: 1),
      );
  static BoxDecoration outlineError(context) => BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Theme.of(context).errorColor, width: 2),
      );

  static BoxDecoration decoration(context) => BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.onPrimary,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0xffeaeaea), blurRadius: 10, offset: Offset(4, 4))
          ]);
  // Return a scaling factor between 0.0 and 1.0 for screens heights ranging
  // from a fixed short to tall range.
  double contentScale(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    const tall = 896.0;
    const short = 480.0;
    return ((height - short) / (tall - short)).clamp(0.0, 1.0);
  }

  // Return a value between low and high for screens heights ranging
  // from a fixed short to tall range.
  double contentScaleFrom(BuildContext context, double low, double high) {
    return low + contentScale(context) * (high - low);
  }

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static ThemeData getThemeFromKey(ThemeType themeKey) {
    switch (themeKey) {
      case ThemeType.LIGHT:
        return lightTheme;
      case ThemeType.DARK:
        return lightTheme;
      default:
        return lightTheme;
    }
  }
}
