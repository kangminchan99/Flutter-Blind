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
          Text('poppins30Bold', style: context.textTheme.poppins30Bold),
          Text('poppins18Bold', style: context.textTheme.poppins18Bold),
          Text('default17Medium', style: context.textTheme.default17Medium),
          Text('default17Regular', style: context.textTheme.default17Regular),
          Text('default15Medium', style: context.textTheme.default15Medium),
          Text('default15Regular', style: context.textTheme.default15Regular),
          Text('default13Medium', style: context.textTheme.default13Medium),
          Text('default13Regular', style: context.textTheme.default13Regular),
        ],
      ),
    );
  }
}
