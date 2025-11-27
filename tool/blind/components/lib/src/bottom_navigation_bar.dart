import 'package:flutter/material.dart';

import 'package:tool_blind_components/component.dart';
import 'package:tool_blind_theme/theme.dart';

enum BlindNavigationType {
  home(title: '홈'),
  notification(title: '알림'),
  my(title: '마이페이지');

  final String title;

  const BlindNavigationType({required this.title});
}

class BlindBottomNavigationItem {
  final BlindNavigationType type;

  const BlindBottomNavigationItem({required this.type});

  factory BlindBottomNavigationItem.home() {
    return const BlindBottomNavigationItem(type: BlindNavigationType.home);
  }

  factory BlindBottomNavigationItem.notification() {
    return const BlindBottomNavigationItem(
      type: BlindNavigationType.notification,
    );
  }

  factory BlindBottomNavigationItem.my() {
    return const BlindBottomNavigationItem(type: BlindNavigationType.my);
  }
}

class BlindBottomNavigationBar extends StatelessWidget {
  final List<BlindBottomNavigationItem> items;
  final int currentIndex;
  final Function(int) onTap;

  const BlindBottomNavigationBar({
    super.key,
    required this.items,
    this.currentIndex = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlindDivider.horizontal(),
        SizedBox(
          height:
              context.navigationBarThemeData.height +
              MediaQuery.viewPaddingOf(context).bottom,
          child: ColoredBox(
            color: context.colorScheme.darkBlack,
            child: Padding(
              padding: EdgeInsets.only(
                left: 60,
                right: 60,
                bottom: MediaQuery.viewPaddingOf(context).bottom,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(items.length, (index) {
                  final BlindBottomNavigationItem item = items[index];
                  final bool isSelected = index == currentIndex;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onTap.call(index),
                      behavior: HitTestBehavior.translucent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BlindNavigationTypeIcon(
                            type: item.type,
                            isSelected: isSelected,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            item.type.title,
                            style: isSelected
                                ? context.textTheme.default11Regular.copyWith(
                                    color: context.colorScheme.gray100,
                                  )
                                : context.textTheme.default11Light.copyWith(
                                    color: context.colorScheme.gray200,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BlindNavigationTypeIcon extends StatelessWidget {
  final BlindNavigationType type;
  final bool isSelected;

  const BlindNavigationTypeIcon({
    super.key,
    required this.type,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = context.colorScheme.white;

    if (isSelected) {
      return switch (type) {
        BlindNavigationType.home => BlindIcon.homeOn(color: color),
        BlindNavigationType.notification => BlindIcon.notificationsOn(
          color: color,
        ),
        BlindNavigationType.my => BlindIcon.personOn(color: color),
      };
    }

    return switch (type) {
      BlindNavigationType.home => BlindIcon.homeOff(color: color),
      BlindNavigationType.notification => BlindIcon.notificationsOff(
        color: color,
      ),
      BlindNavigationType.my => BlindIcon.personOff(color: color),
    };
  }
}
