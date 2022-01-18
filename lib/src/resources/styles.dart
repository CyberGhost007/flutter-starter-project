import 'package:flutter/material.dart';

class Styles {
  static InputDecoration inputDecoration({
    width = 1.0,
  }) {
    return InputDecoration(
      counterText: '',
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: const Color(0xffCED2D9), width: width),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: const Color(0xffCED2D9), width: width),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: const Color(0xffCED2D9), width: width),
      ),
    );
  }

  static TextEditingController textEditController({text = ''}) {
    return TextEditingController.fromValue(
      TextEditingValue(
        text: text == null ? '' : text.toString(),
        selection: TextSelection.fromPosition(
          TextPosition(
            affinity: TextAffinity.downstream,
            offset: text.toString().length,
          ),
        ),
      ),
    );
  }
}
