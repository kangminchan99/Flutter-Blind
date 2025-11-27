import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Blind'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 100, color: context.colorScheme.bg2),
          Container(height: 100, color: context.colorScheme.gray300),
          Container(height: 100, color: context.colorScheme.gray500),
          Container(height: 100, color: context.colorScheme.gray700),
        ],
      ),
    );
  }
}
