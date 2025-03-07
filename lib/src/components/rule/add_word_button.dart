import 'package:flutter/material.dart';

typedef OnSave = void Function(String);

class AddWordButton extends StatefulWidget {
  const AddWordButton({super.key, required this.onSave});
  final OnSave onSave;

  @override
  State<AddWordButton> createState() => _AddWordButtonState();
}

const double size = 30;

class _AddWordButtonState extends State<AddWordButton> {
  bool isActivate = false;
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 6, right: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue.withValues(alpha: 0.2),
      ),
      child: FittedBox(
        child:
            !isActivate
                ? InkWell(
                  onTap: () {
                    setState(() {
                      isActivate = !isActivate;
                    });
                  },
                  child: const Icon(Icons.add, size: 18),
                )
                : SizedBox(
                  width: 300,
                  height: size,
                  child: Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller,
                          maxLength: 20,
                          style: const TextStyle(fontSize: 16),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            counterText: "",
                            hintStyle: TextStyle(fontSize: 16),
                            hintText: "Max length 20",
                            // fillColor: AppStyle.inputFillColor,
                            filled: true,
                            contentPadding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              bottom: 18,
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        child: const Icon(Icons.check, size: size),
                        onTap: () {
                          setState(() {
                            widget.onSave(controller.text);
                            isActivate = !isActivate;
                          });
                        },
                      ),

                      InkWell(
                        child: const Icon(Icons.refresh, size: size),
                        onTap: () {
                          controller.text = "";
                        },
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
