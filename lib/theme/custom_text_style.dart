import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodySmallCyan300 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.cyan300,
      );
  static get bodySmallPoppinsBluegray300 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.blueGray300,
      );
  static get bodySmallPoppinsGray50 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.gray50,
      );
  static get bodySmallPoppinsPrimary =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallPoppinsPrimary_1 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeCyan300 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.cyan300,
      );
  static get labelLargePoppinsIndigoA200 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.indigoA200,
        fontWeight: FontWeight.w700,
      );
  static get labelLargePoppinsPrimary =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get labelLargePoppinsPrimaryBold =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimaryContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimaryContainer_1 =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get labelMediumErrorContainer => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumPrimaryContainer =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get labelSmall9 => theme.textTheme.labelSmall!.copyWith(
        fontSize: getFontSize(
          9,
        ),
      );
  static get labelSmallBluegray100 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.blueGray100,
      );
  static get labelSmallBluegray1009 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.blueGray100,
        fontSize: getFontSize(
          9,
        ),
      );
  static get labelSmallCyan300 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.cyan300,
      );
  static get labelSmallCyan3009 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.cyan300,
        fontSize: getFontSize(
          9,
        ),
      );
  // Title text style
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: getFontSize(
          18,
        ),
      );
  static get titleMediumBlack => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w900,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumCyan300 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.cyan300,
      );
  static get titleMediumErrorContainer => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get titleMediumPoppinsOnErrorContainer =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPoppinsOnPrimary =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: getFontSize(
          18,
        ),
      );
  static get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallCyan300 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.cyan300,
      );
  static get titleSmallErrorContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPrimaryContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get titleSmallTeal300 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.teal300,
      );
  static get titleSmall_1 => theme.textTheme.titleSmall!;
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
