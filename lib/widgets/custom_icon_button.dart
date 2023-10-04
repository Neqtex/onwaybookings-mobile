import 'package:chike_s_application/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.margin,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: SizedBox(
          height: height ?? 0,
          width: width ?? 0,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
              padding: padding ?? EdgeInsets.zero,
              decoration: decoration ??
                  BoxDecoration(
                    color: appTheme.blueGray50,
                    borderRadius:
                        BorderRadius.circular(getHorizontalSize(21.00)),
                  ),
              child: child,
            ),
            onPressed: onTap,
          ),
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillCyan => BoxDecoration(
        color: appTheme.cyan300,
        borderRadius: BorderRadius.circular(getHorizontalSize(15.00)),
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray50,
        borderRadius: BorderRadius.circular(getHorizontalSize(8.00)),
      );
  static BoxDecoration get fillBlueGrayTL18 => BoxDecoration(
        color: appTheme.blueGray50,
        borderRadius: BorderRadius.circular(getHorizontalSize(18.00)),
      );
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.cyan300,
        borderRadius: BorderRadius.circular(getHorizontalSize(27.00)),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: getHorizontalSize(2.00),
            blurRadius: getHorizontalSize(2.00),
            offset: Offset(
              0,
              8,
            ),
          ),
        ],
      );
}
