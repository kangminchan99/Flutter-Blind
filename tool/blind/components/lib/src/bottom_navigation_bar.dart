import 'package:core_util/util.dart';
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

class BlindChatBottomNavigationBar extends StatefulWidget {
  final String hintText;
  final int minLines;
  final int maxLines;
  final Function(String) onSend;

  const BlindChatBottomNavigationBar({
    super.key,
    this.hintText = '',
    this.minLines = 1,
    this.maxLines = 4,
    required this.onSend,
  });

  @override
  State<BlindChatBottomNavigationBar> createState() =>
      _BlindChatBottomNavigationBarState();
}

class _BlindChatBottomNavigationBarState
    extends State<BlindChatBottomNavigationBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double threshold = MediaQuery.viewPaddingOf(context).bottom + 50.0;
    final double bottomPadding = MediaQuery.viewPaddingOf(context).bottom;
    final double keyboardHeight = MediaQuery.viewInsetsOf(context).bottom;
    final bool hasKeyboard =
        MediaQuery.viewInsetsOf(context).bottom > threshold;

    return Container(
      height: 82.0 + (hasKeyboard ? keyboardHeight : bottomPadding),
      decoration: BoxDecoration(
        color: context.colorScheme.bg2,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      padding: EdgeInsets.only(
        bottom: hasKeyboard ? keyboardHeight : bottomPadding,
      ),
      child: Row(
        children: [
          const SizedBox(width: 17.0),
          BlindIcon.imagesMode(color: context.colorScheme.gray400),
          const SizedBox(width: 12.0),
          Expanded(
            child: CoreTextField(
              controller: _controller,
              cursorColor: context.colorScheme.white,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: context.textTheme.default15SemiBold.copyWith(
                  color: context.colorScheme.gray600,
                ),
              ),
              style: context.textTheme.default15SemiBold.copyWith(
                color: context.colorScheme.gray200,
              ),
              keyboardAppearance: context.colorScheme.brightness,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
            ),
          ),
          const SizedBox(width: 12.0),
          GestureDetector(
            onTap: () {
              widget.onSend.call(_controller.text);
              _controller.clear();
            },
            behavior: HitTestBehavior.translucent,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: context.colorScheme.gray200),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '전송',
                  style: context.textTheme.default15SemiBold.copyWith(
                    color: context.colorScheme.gray200,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
    );
  }
}
