import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_blind_components/component.dart';
import 'package:tool_blind_theme/theme.dart';

class BlindSortFilter extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const BlindSortFilter({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      behavior: HitTestBehavior.translucent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlindIcon.expandMore(color: context.colorScheme.gray400),
          const SizedBox(width: 3.0),
          Flexible(
            child: Text(
              text,
              style: context.textTheme.default13Medium.copyWith(
                color: context.colorScheme.gray400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlindLoadingSortFilter extends StatelessWidget {
  const BlindLoadingSortFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return CoreShimmer(
      baseColor: context.colorScheme.gray800,
      highlightColor: context.colorScheme.gray900,
      child: Container(
        width: 60.0,
        height: 18.0,
        decoration: BoxDecoration(
          color: context.colorScheme.gray800,
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }
}
