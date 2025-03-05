import 'package:ai_desensitization/src/isar/rule.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              _title(
                Text(
                  "Basic infomation",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
              _basicInfo(),
              _title(
                Text(
                  "Advanced infomation",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
              _advancedInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(Widget child) {
    return Container(
      height: 30,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: Colors.blueAccent.withAlpha(64),
      ),
      child: Center(child: child),
    );
  }

  Widget _basicInfo() {
    return Material(
      borderRadius: BorderRadius.circular(4),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        height: 200,
        child: Column(
          spacing: 20,
          children: [
            SizedBox(
              height: 30,
              child: TextField(
                style: TextStyle(fontSize: 12),
                autofocus: true,
                // controller: ,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  hintText: "Rule name",
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                maxLines: 6,
                style: TextStyle(fontSize: 12),
                autofocus: true,
                // controller: ,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  hintText: "Rule description",
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  late String selectedRuleType = RuleType.values[0].name;
  late String selectedDesensitizationFunc = DesensitizationFunc.values[0].name;

  Widget _advancedInfo() {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(4),
        elevation: 5,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            spacing: 10,
            children: [
              // rule type
              SizedBox(
                height: 30,
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 12),
                        autofocus: true,
                        // controller: ,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText: "Rule pattern",
                          hintStyle: TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 125,
                      height: 30,
                      child: DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          // Add more decoration..
                        ),
                        customButton: SizedBox(
                          width: 100,
                          height: 30,
                          child: Center(
                            child: Row(
                              spacing: 5,
                              children: [
                                SizedBox(width: 5),
                                Text(
                                  selectedRuleType,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                        ),
                        value: selectedRuleType,
                        items:
                            RuleType.values
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item.name,
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          if (value == null || value == selectedRuleType) {
                            return;
                          }
                          setState(() {
                            selectedRuleType = value.toString();
                          });
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 16,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // func
              SizedBox(
                height: 30,
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: Text(
                        "Desensitization func",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      width: 125,
                      height: 30,
                      child: DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          // Add more decoration..
                        ),
                        customButton: SizedBox(
                          width: 100,
                          height: 30,
                          child: Center(
                            child: Row(
                              spacing: 5,
                              children: [
                                SizedBox(width: 5),
                                Text(
                                  selectedDesensitizationFunc,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                        ),
                        value: selectedDesensitizationFunc,
                        items:
                            DesensitizationFunc.values
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item.name,
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          if (value == null ||
                              value == selectedDesensitizationFunc) {
                            return;
                          }
                          setState(() {
                            selectedDesensitizationFunc = value.toString();
                          });
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 16,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // samples
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Samples",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
