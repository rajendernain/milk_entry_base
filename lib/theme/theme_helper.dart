import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();





class ThemeHelper {
  //current app theme
  var _appTheme = PrefUtils().getThemeData();


  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };


  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };


  LightCodeColors _getThemeColors(){
    return _supportedCustomColor[_appTheme]?? LightCodeColors();
  }

  //return the current theme data
  ThemeData _getThemeData(){
    var colorScheme = _supportedColorScheme[_appTheme]?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimaryContainer,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: appTheme.black90033,
          elevation: 3,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
              width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray500,
      ),
    );
  }

  /// return the lightCode colors for the current theme
  LightCodeColors themeColor() => _getThemeColors();
  //return the current theme data
  ThemeData themeData() => _getThemeData();
}


class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: appTheme.gray600,
      fontSize: 19.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: appTheme.gray600,
      fontSize: 15.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),

    displayMedium: TextStyle(
      color: appTheme.cyan300,
      fontSize: 50.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: colorScheme.onPrimary,
      fontSize: 35.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      color: appTheme.cyan300,
      fontSize: 33.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
    ),
    headlineMedium: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 28.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      color: appTheme.gray500,
      fontSize: 25.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
    ),
    titleLarge: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 20.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: appTheme.gray600,
      fontSize: 16.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: appTheme.gray600,
      fontSize: 14.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
  );
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFFFF77473),
    secondaryContainer: Color(0XFFFFD987),
    onPrimary: Color(0XFF1F41BB),
    onPrimaryContainer: Color(0XFFFFFFFF),
  );
}

class LightCodeColors {
  Color get amber300 => Color(0XFFFFC953);
  Color get black900 => Color(0XFF000000);
  Color get black90033 => Color(0X33000000);
  Color get blue200 => Color(0XFFABBEFF);
  Color get blue20001 => Color(0XFFA6BDFD);

  Color get blueGray400 => Color(0XFF888888);
  Color get cyan300 => Color(0XFF48B7E1);
  Color get gray500 => Color(0XFF959595);
  Color get gray600 => Color(0XFF828282);
  Color get gray60001 => Color(0XFF817F7F);
  Color get lightBlue300 => Color(0XFF53B8E4);
  Color get orangeA100 => Color(0XFFF9D37F);
  Color get pinkA100 => Color(0XFFFF73A9);
  Color get bottomBarL => Color(0XFF48B7E1);
  Color get bottomBarR => Color(0XFFABBEFF);
  Color get maroon => Color(0XFFFF7473);
}