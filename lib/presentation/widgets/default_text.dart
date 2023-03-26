import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? textColor;
  final double? textSize;
  final FontStyle? textStyle;
  final FontWeight? weight;
  final TextStyle? style;

  const DefaultText({
    Key? key,
    required this.text,
    this.overflow,
    this.textAlign,
    this.maxLines,
    this.textColor,
    this.textSize,
    this.textStyle,
    this.weight,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: style != null
          ? style!.copyWith(
              color: textColor,
              fontSize: textSize,
              fontStyle: textStyle,
              fontWeight: weight,
            )
          : TextStyle(
              color: textColor,
              fontSize: textSize,
              fontStyle: textStyle,
              fontWeight: weight,
            ),
    );
  }
}
