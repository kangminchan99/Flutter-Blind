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
      appBar: BlindAppBar(
        context: context,
        title: BlindSearchTextField(text: 'test', onSearch: (_) {}),
      ),
      body: Column(
        children: [
          BlindSearchBar(text: '', onTap: () {}),
          BlindLoadingSearchBar(),
          BlindSortFilter(text: '최신순', onTap: () {}),
        ],
      ),
      floatingActionButton: BlindWriteButton(
        onTap: () {
          BlindDialog.showConfirm(context, title: 'test', onConfirm: () {});
        },
      ),
      bottomNavigationBar: BlindChatBottomNavigationBar(onSend: (_) {}),
    );
  }
}
