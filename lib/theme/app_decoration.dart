import 'package:flutter/material.dart';
import 'package:chike_s_application/core/app_export.dart';

class AppDecoration {
  // Bg decorations
  static BoxDecoration get bg => BoxDecoration(
        color: appTheme.cyan300,
      );

  // Fill decorations
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray50,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray400,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  // Gradient decorations
  static BoxDecoration get gradientCyanToTeal => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0, 0.47),
          colors: [
            appTheme.cyan300,
            appTheme.teal400,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.blueGray50,
          width: getHorizontalSize(1),
        ),
      );
  static BoxDecoration get outlineBluegray10001 => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray10001,
          width: getHorizontalSize(1),
        ),
      );
  static BoxDecoration get outlineBluegray50 => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray50,
          width: getHorizontalSize(1),
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder40 => BorderRadius.circular(
        getHorizontalSize(40),
      );

  // Custom borders
  static BorderRadius get customBorderBL5 => BorderRadius.only(
        topRight: Radius.circular(getHorizontalSize(5)),
        bottomLeft: Radius.circular(getHorizontalSize(5)),
        bottomRight: Radius.circular(getHorizontalSize(5)),
      );
  static BorderRadius get customBorderBL8 => BorderRadius.only(
        topRight: Radius.circular(getHorizontalSize(8)),
        bottomLeft: Radius.circular(getHorizontalSize(8)),
        bottomRight: Radius.circular(getHorizontalSize(8)),
      );
  static BorderRadius get customBorderTL30 => BorderRadius.vertical(
        top: Radius.circular(getHorizontalSize(30)),
      );
  static BorderRadius get customBorderTL8 => BorderRadius.only(
        topLeft: Radius.circular(getHorizontalSize(8)),
        bottomLeft: Radius.circular(getHorizontalSize(8)),
        bottomRight: Radius.circular(getHorizontalSize(8)),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        getHorizontalSize(10),
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
