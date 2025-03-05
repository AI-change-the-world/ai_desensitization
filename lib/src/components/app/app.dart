import 'package:ai_desensitization/src/components/rule/rule_screen.dart';
import 'package:ai_desensitization/src/components/sidebar/sidebar.dart';
import 'package:ai_desensitization/src/components/sidebar/sidebar_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: PageView(
              controller: ref.read(sidebarProvider.notifier).pageController,
              children: [RuleScreen(), Container(), Container()],
            ),
          ),
        ],
      ),
    );
  }
}
