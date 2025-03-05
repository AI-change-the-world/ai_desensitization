import 'package:ai_desensitization/src/components/rule/rules_widget.dart';
import 'package:ai_desensitization/src/isar/rule.dart';
import 'package:flutter/material.dart';

class RuleScreen extends StatelessWidget {
  const RuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:
            EntityType.values.map((v) => RulesWidget(entityType: v)).toList(),
      ),
    );
  }
}
