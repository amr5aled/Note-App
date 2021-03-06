import 'package:flutter/material.dart';

enum ThemeType {
  orangeLight,
}

/// AppTheme is the primary means of styling colors in your application.
/// Use provider to lookup and bind to the current theme:
//      AppTheme theme = context.watch();
//      return Container(color: theme.accentColor);
class AppTheme {
  AppTheme({required this.isDark}) {
    mainTextColor = isDark! ? Colors.white : Colors.black;
    inverseTextColor = inverseTextColor ?? (isDark! ? Colors.black : Colors.white);
  }
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.orangeLight:
        return AppTheme(isDark: false)
          ..type = t
          ..bg1 = const Color(0xfff3f3f3)
          ..surface1 = Colors.white
          ..accent1 = const Color(0xffff392b)
          ..greyWeak = const Color(0xffcccccc)
          ..grey = const Color(0xff999999)
          ..greyMedium = const Color(0xff747474)
          ..greyStrong = const Color(0xff333333)
          ..focus = const Color(0xffd81e1e);

      default:
        return AppTheme.fromType(defaultTheme);
    }
  }
  static ThemeType defaultTheme = ThemeType.orangeLight;

  ThemeType? type;
  bool? isDark;
  Color? bg1;
  Color? surface1;
  Color? accent1;
  Color? greyWeak;
  Color? grey;
  Color? greyMedium;
  Color? greyStrong;
  Color? focus;

  /// Darkness adjusted text color. Will be Black in light mode, and White in dark
  Color? mainTextColor;
  Color? inverseTextColor;

  /// Default constructor

  /// Creates an AppTheme from a provided Type.

  // Converts AppTheme into a Material Theme Data, using whatever mappings we like
  ThemeData get themeData {
    final ThemeData t = ThemeData.from(
      // Use the .dark() and .light() constructors to handle the text themes
      textTheme: (isDark! ? ThemeData.dark() : ThemeData.light()).textTheme,
      // Use ColorScheme to generate the bulk of the color theme
      colorScheme: ColorScheme(
          brightness: isDark! ? Brightness.dark : Brightness.light,
          primary: accent1!,
          primaryVariant: shift(accent1!, .1),
          secondary: accent1!,
          secondaryVariant: shift(accent1!, .1),
          background: bg1!,
          surface: surface1!,
          onBackground: mainTextColor!,
          onSurface: mainTextColor!,
          onError: mainTextColor!,
          onPrimary: inverseTextColor!,
          onSecondary: inverseTextColor!,
          error: focus!),
    );
    // Apply additional styling that is missed by ColorScheme
    t.copyWith(
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: surface1,
          selectionHandleColor: Colors.transparent,
          selectionColor: surface1,
        ),
        // ignore: deprecated_member_use
        buttonColor: accent1,
        highlightColor: shift(accent1!, .1),
        toggleableActiveColor: accent1);
    // All done, return the ThemeData
    return t;
  }

  /// This will add luminance in dark mode, and remove it in light.
  // Allows the view to just make something "stronger" or "weaker" without worrying what the current theme brightness is
  //      color = theme.shift(someColor, .1); //-10% lum in dark mode, +10% in light mode
  Color shift(Color c, double amt) {
    amt *= isDark! ? -1 : 1;
    final HSLColor hslc = HSLColor.fromColor(c); // Convert to HSL
    final double lightness = (hslc.lightness + amt).clamp(0, 1.0) as double; // Add/Remove lightness
    return hslc.withLightness(lightness).toColor(); // Convert back to Color
  }
}
