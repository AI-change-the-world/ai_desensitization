import 'package:ai_desensitization/src/isar/rule.dart';
import 'package:flutter/material.dart';

class AddRuleDialog extends StatefulWidget {
  const AddRuleDialog({super.key, required this.entityType});
  final EntityType entityType;

  @override
  State<AddRuleDialog> createState() => _AddState();
}

class _AddState extends State<AddRuleDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: 400,
        height: 550,
      ),
    );
  }
}
