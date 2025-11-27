import 'package:flutter/material.dart';
import 'package:tool_blind_theme/theme.dart';

class BlindDivider extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;

  const BlindDivider({
    super.key,
    required this.width,
    required this.height,
    this.color,
  });

  factory BlindDivider.vertical({double thickness = 1.0, Color? color}) {
    return BlindDivider(
      width: thickness,
      height: double.infinity,
      color: color,
    );
  }

  factory BlindDivider.horizontal({double thickness = 1.0, Color? color}) {
    return BlindDivider(
      width: double.infinity,
      height: thickness,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ColoredBox(color: color ?? context.dividerTheme.color),
    );
  }
}
