import 'package:flutter/material.dart';
import 'package:tool_blind_theme/gen/colors.gen.dart';
import 'package:tool_blind_theme/theme.dart';

class CommunityAllChannelButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const CommunityAllChannelButton({super.key, this.text = '전체', this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: 63.0,
        child: ColoredBox(
          color: context.colorScheme.darkBlack,
          child: Center(
            child: Text(
              text,
              style: context.textTheme.default14Medium.copyWith(
                color: ColorName.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
