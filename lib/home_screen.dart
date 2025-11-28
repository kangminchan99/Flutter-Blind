import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tool_blind_components/component.dart';
import 'package:tool_blind_network/network.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final apiClient = await BlindRestClient().get<dynamic>(
        '/post-api/channels',
      );

      if (kDebugMode) {
        print(apiClient.data);
      }
    });
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
