import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tool_blind_components/component.dart';
import 'package:tool_blind_theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Blind'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: BlindCardButton.like(
                  context,
                  onTap: () {},
                  isSelected: true,
                ),
              ),
              Expanded(
                child: BlindCardButton.comment(
                  context,
                  onTap: () {},
                  count: 100000,
                ),
              ),
              Expanded(
                child: BlindCardButton.view(context, onTap: () {}, count: 1000),
              ),
            ],
          ),
          BlindLoadingPostCard(),
          BlindDivider.horizontal(),
          BlindIcon.imagesMode(color: context.colorScheme.white),
          BlindProfileImage(imageUrl: ''),
          BlindSettingTile.simple(context, title: 'test', onTap: () {}),
        ],
      ),
      bottomNavigationBar: BlindBottomNavigationBar(
        items: [
          BlindBottomNavigationItem.home(),
          BlindBottomNavigationItem.notification(),
          BlindBottomNavigationItem.my(),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}
