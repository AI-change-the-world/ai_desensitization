import 'package:ai_desensitization/src/components/rule/add_rule_dialog.dart';
import 'package:ai_desensitization/src/isar/rule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RulesWidget extends ConsumerStatefulWidget {
  const RulesWidget({super.key, required this.entityType});
  final EntityType entityType;

  @override
  ConsumerState<RulesWidget> createState() => _RulesWidgetState();
}

class _RulesWidgetState extends ConsumerState<RulesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            spacing: 10,
            children: [
              Text(
                widget.entityType.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Material(
                borderRadius: BorderRadius.circular(20),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      showGeneralDialog(
                        barrierDismissible: true,
                        barrierLabel: "add-rule-dialog",
                        barrierColor: Colors.white.withValues(alpha: 0.1),
                        transitionDuration: Duration(milliseconds: 200),
                        context: context,
                        pageBuilder: (c, _, __) {
                          return Center(
                            child: AddRuleDialog(entityType: widget.entityType),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(1),
                      child: Icon(Icons.add, color: Colors.white, size: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: SizedBox(width: double.infinity)),
        ],
      ),
    );
  }
}
