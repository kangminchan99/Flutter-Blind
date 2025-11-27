import 'package:flutter/material.dart';
import 'package:tool_blind_components/component.dart';
import 'package:tool_blind_theme/theme.dart';
import 'package:core_util/util.dart';

class BlindChannelTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int followCount;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const BlindChannelTile({
    super.key,
    required this.imageUrl,
    required this.name,
    this.followCount = 0,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      behavior: HitTestBehavior.translucent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlindProfileImage(imageUrl: imageUrl, size: 46.0),
          const SizedBox(width: 14.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.textTheme.default15Medium.copyWith(
                    color: context.colorScheme.gray100,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${followCount.convertToKMB()} 팔로우',
                  style: context.textTheme.default14Regular.copyWith(
                    color: context.colorScheme.gray600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (onDelete != null) ...[
            GestureDetector(
              onTap: () => onDelete!.call(),
              behavior: HitTestBehavior.translucent,
              child: SizedBox(
                width: 46.0,
                height: 46.0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: BlindIcon.close(color: context.colorScheme.gray600),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class BlindNotificationTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String content;
  final DateTime createdAt;
  final VoidCallback onTap;

  const BlindNotificationTile({
    super.key,
    this.leading,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.onTap,
  });

  factory BlindNotificationTile.icon({
    required String icon,
    required Color iconColor,
    required String title,
    required String content,
    required DateTime createdAt,
    required VoidCallback onTap,
  }) {
    return BlindNotificationTile(
      leading: BlindSvgPicture.asset(icon, color: iconColor),
      title: title,
      content: content,
      createdAt: createdAt,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 8.0)],
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.default13Medium.copyWith(
                      color: context.colorScheme.gray500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    content,
                    style: context.textTheme.default15Regular.copyWith(
                      color: context.colorScheme.gray200,
                      height: 19.5 / 15.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    createdAt.toTimeAgo(),
                    style: context.textTheme.default13Medium.copyWith(
                      color: context.colorScheme.gray500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlindSettingTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;

  const BlindSettingTile({
    super.key,
    this.leading,
    this.title = '',
    this.trailing,
    required this.onTap,
  });

  factory BlindSettingTile.simple(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return BlindSettingTile(
      title: title,
      trailing: BlindIcon.chevronRight(color: context.colorScheme.gray600),
      onTap: onTap,
    );
  }

  factory BlindSettingTile.icon(
    BuildContext context, {
    required String icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return BlindSettingTile(
      leading: BlindSvgPicture.asset(icon),
      title: title,
      trailing: BlindIcon.chevronRight(color: context.colorScheme.gray500),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 50.0,
        color: context.colorScheme.lightBlack,
        padding: const EdgeInsets.only(
          top: 13.0,
          bottom: 13.0,
          left: 20.0,
          right: 8.0,
        ),
        child: Row(
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 10.0)],
            Expanded(
              child: Text(
                title,
                style: context.textTheme.default17Regular.copyWith(
                  color: context.colorScheme.gray200,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (trailing != null) ...[const SizedBox(width: 12.0), trailing!],
          ],
        ),
      ),
    );
  }
}
