import 'dart:async';

import 'package:ai_desensitization/src/components/rule/add_word_button.dart';
import 'package:ai_desensitization/src/components/rule/word_desensitization.dart';
import 'package:ai_desensitization/src/components/rule/word_with_tag.dart';
import 'package:ai_desensitization/src/isar/rule.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class AddRuleDialog extends StatefulWidget {
  const AddRuleDialog({super.key, required this.entityType});
  final EntityType entityType;

  @override
  State<AddRuleDialog> createState() => _AddState();
}

class _AddState extends State<AddRuleDialog> {
  late ScrollController _leftController;
  late ScrollController _rightController;
  bool _isLeftScrolling = false;
  bool _isRightScrolling = false;

  @override
  void initState() {
    super.initState();
    _leftController = ScrollController();
    _rightController = ScrollController();

    _leftController.addListener(() {
      if (!_isRightScrolling) {
        _isLeftScrolling = true;
        _rightController.jumpTo(_leftController.offset);
        _isLeftScrolling = false;
      }
    });

    _rightController.addListener(() {
      if (!_isLeftScrolling) {
        _isRightScrolling = true;
        _leftController.jumpTo(_rightController.offset);
        _isRightScrolling = false;
      }
    });
  }

  @override
  void dispose() {
    _leftController.dispose();
    _rightController.dispose();
    controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

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
        height: 150,
        child: Column(
          spacing: 10,
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
                maxLines: 5,
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

  late RuleType selectedRuleType = RuleType.values[0];
  late DesensitizationFunc selectedDesensitizationFunc =
      DesensitizationFunc.values[0];
  late List<String> words = [];
  late final TextEditingController controller = TextEditingController();

  Timer? _debounce;
  final Duration _debounceDuration = Duration(milliseconds: 500);

  void _onTextChanged(String text) {
    // 取消之前的定时器
    _debounce?.cancel();

    // 启动新的定时器
    _debounce = Timer(_debounceDuration, () {
      // 0.5s 内没有新的输入，执行操作
      setState(() {});
    });
  }

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
                        controller: controller,
                        onChanged: _onTextChanged,
                        enabled: selectedRuleType != RuleType.wordcut,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText:
                              selectedRuleType == RuleType.wordcut
                                  ? ""
                                  : selectedRuleType == RuleType.fuzzy
                                  ? "Input prompt"
                                  : "Rule pattern",
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
                      child: DropdownButtonFormField2<RuleType>(
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
                                  selectedRuleType.name,
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
                                  (item) => DropdownMenuItem<RuleType>(
                                    value: item,
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
                            selectedRuleType = value;
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
                      child: DropdownButtonFormField2<DesensitizationFunc>(
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
                                  selectedDesensitizationFunc.name,
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
                                  (item) =>
                                      DropdownMenuItem<DesensitizationFunc>(
                                        value: item,
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
                            selectedDesensitizationFunc = value;
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

              Expanded(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          border: Border.all(color: Colors.black45),
                        ),
                        child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          controller: _leftController,
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...words.mapIndexed(
                                (i, e) => WordWithTag(
                                  text: e,
                                  index: i,
                                  onDelete: (index) {
                                    setState(() {
                                      words.removeAt(index);
                                    });
                                  },
                                ),
                              ),
                              AddWordButton(
                                onSave: (s) {
                                  if (s.trim().isEmpty) {
                                    return;
                                  }
                                  setState(() {
                                    // widgets.add(WordWithTag(text: s));
                                    words.add(s);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          border: Border.all(color: Colors.black45),
                        ),
                        child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          controller: _rightController,
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...words.mapIndexed(
                                (i, e) => WordDesensitization(
                                  text: e,
                                  params:
                                      controller.text.trim().isNotEmpty
                                          ? [controller.text]
                                          : [],
                                  type: selectedRuleType.order,
                                  desensitizationType:
                                      selectedDesensitizationFunc.order,
                                ),
                              ),
                              SizedBox(height: 26),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {}, child: Text("Save")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
