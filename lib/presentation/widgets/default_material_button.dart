import 'package:flutter/material.dart';

class DefaultMaterialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? elevation;
  final double radius;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color? splashColor;
  final EdgeInsetsGeometry? internalPadding;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;

  const DefaultMaterialButton({
    Key? key,
    required this.onPressed,
    this.elevation,
    this.backgroundColor = Colors.deepOrange,
    this.splashColor,
    this.internalPadding,
    this.radius = 10,
    this.child,
    this.height = 50,
    this.width = double.infinity,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: elevation,
        color: backgroundColor,
        splashColor: splashColor,
        padding: internalPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child,
      ),
    );
  }
}
