import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SmsCodeInputFormatter extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 7) {
      return oldValue;
    }

    String text = newValue.text;
    TextSelection selection = newValue.selection;

    if (text.contains(' ')) {
      text = text.replaceAll(' ', '');
      if (selection.baseOffset > 3) {
        selection = _offsetSelection(selection, -1);
      }
    }

    if (text.length > 3) {
      text = text.substring(0, 3) + ' ' + text.substring(3, text.length);
      if (selection.baseOffset > 3) {
        selection = _offsetSelection(selection, 1);
      }
    }

    return newValue.copyWith(text: text, selection: selection);
  }

  TextSelection _offsetSelection(TextSelection selection, int offset) =>
      selection.copyWith(baseOffset: selection.baseOffset + offset, extentOffset: selection.extentOffset + offset);
}
