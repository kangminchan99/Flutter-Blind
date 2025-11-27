import 'package:flutter/material.dart';
import 'package:tool_blind_components/component.dart';
import 'package:tool_blind_theme/theme.dart';

class BlindAppBar extends AppBar {
  BlindAppBar({
    super.key,
    required BuildContext context,
    super.leading,
    super.title,
    super.automaticallyImplyLeading = false,
    super.actions,
    super.leadingWidth = 41.0,
    super.elevation = 0,
    double? titleSpacing,
    double? toolbarHeight,
    Color? backgroundColor,
    bool? centerTitle,
  }) : super(
         scrolledUnderElevation: 0,
         titleSpacing: titleSpacing ?? context.appBarTheme.titleSpacing,
         backgroundColor:
             backgroundColor ?? context.appBarTheme.backgroundColor,
         centerTitle: centerTitle ?? context.appBarTheme.centerTitle,
         toolbarHeight: toolbarHeight ?? context.appBarTheme.toolbarHeight,
         systemOverlayStyle: context.appBarTheme.systemOverlayStyle,
       );
}

class BlindAppBarTitle extends StatelessWidget {
  final Widget title;
  final Widget? leading;
  final Widget? trailing;

  const BlindAppBarTitle({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
  });

  factory BlindAppBarTitle.simple(
    BuildContext context, {
    required String text,
  }) {
    return BlindAppBarTitle(
      title: Text(
        text,
        style: context.textTheme.default17Regular.copyWith(
          color: context.appBarTheme.primaryColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  factory BlindAppBarTitle.logo(BuildContext context) {
    return BlindAppBarTitle(
      title: Text(
        'Blind',
        style: context.textTheme.poppins18Bold.copyWith(
          color: context.colorScheme.gray600,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) leading!,
        Flexible(child: title),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class BlindAppBarBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const BlindAppBarBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (onTap != null) {
          onTap!.call();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        width: 41.0,
        padding: const EdgeInsets.only(right: 5.0),
        alignment: Alignment.centerRight,
        child: BlindIcon.arrowBack(color: context.colorScheme.gray300),
      ),
    );
  }
}

class BlindAppBarTextButton extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final Alignment alignment;
  final Color? color;
  final VoidCallback onTap;

  const BlindAppBarTextButton({
    super.key,
    required this.text,
    this.padding = EdgeInsets.zero,
    this.alignment = Alignment.center,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap.call(),
      child: SizedBox(
        width: 56.0,
        child: Align(
          alignment: alignment,
          child: Padding(
            padding: padding,
            child: Text(
              text,
              style: context.textTheme.default15Medium.copyWith(color: color),
            ),
          ),
        ),
      ),
    );
  }
}

class BlindAppBarIconAction extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onTap;

  const BlindAppBarIconAction({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap?.call(),
      child: SizedBox(width: 39.0, child: Center(child: icon)),
    );
  }
}
