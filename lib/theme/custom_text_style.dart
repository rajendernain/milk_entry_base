import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}

class CustomTextStyles {
  static get displayMediumPrimary => theme.textTheme.displayMedium!.copyWith(
    color: theme.colorScheme.primary,
    fontWeight: FontWeight.w700,
  );

  static get displaySmallPrimary => theme.textTheme.displaySmall!.copyWith(
    color: theme.colorScheme.primary,
    fontSize: 38.fSize,
    fontWeight: FontWeight.w700,
  );
  static get headlineLargePrimary => theme.textTheme.headlineLarge!.copyWith(
    color: theme.colorScheme.primary,
  );
  static get headlineLargePrimary_1 => theme.textTheme.headlineLarge!.copyWith(
    color: theme.colorScheme.primary,
  );
  static get headlineMediumGray600 => theme.textTheme.headlineMedium!.copyWith(
    color: appTheme.gray600,
    fontWeight: FontWeight.w300,
  );
  static get headlineMediumLight=> theme.textTheme.headlineMedium!.copyWith(
    fontWeight: FontWeight.w300,
  );
  static get headlineMediumOnPrimary=> theme.textTheme.headlineMedium!.copyWith(
    color: theme.colorScheme.onPrimary,
    fontWeight: FontWeight.w600,
  );
  static get headlineMediumOnPrimaryBold=> theme.textTheme.headlineMedium!.copyWith(
    color: theme.colorScheme.onPrimary,
    fontWeight: FontWeight.w600,
  );
  static get headlineMediumRegular=> theme.textTheme.headlineMedium!.copyWith(
    fontWeight: FontWeight.w400,
  );

  static get titleMediumCyan300=> theme.textTheme.titleMedium!.copyWith(
    color: appTheme.cyan300,
  );
  static get titleMediumGray60001=> theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray60001,
  );


}