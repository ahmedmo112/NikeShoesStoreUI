import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.child,
      this.color,
      this.borderRadius,
      required this.onTap,
      this.margin,
      this.padding,
      this.height=50,
      this.width=50
      })
      : super(key: key);
  final Widget child;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            margin: margin,
            padding: padding,
            height: height,
            width: width,
            child: child),
      ),
    );
  }
}
