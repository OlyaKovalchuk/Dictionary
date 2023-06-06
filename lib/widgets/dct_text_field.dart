import 'package:dictionary/res/dct_styles.dart';
import 'package:dictionary/res/dct_theme.dart';
import 'package:flutter/material.dart';

class DctTextField extends TextFormField {
  DctTextField({
    super.key,
    super.controller,
    super.keyboardType,
    super.onChanged,
    super.obscureText,
    super.maxLength,
    super.validator,
    super.enableInteractiveSelection,
    Widget? suffix,
    String? hintText,
  }) : super(
          style: DctStyles.b1BlackRegular16Roboto,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: textFieldBorder,
            disabledBorder: textFieldBorder,
            enabledBorder: textFieldBorder,
            focusedBorder: selectedTextFieldBorder,
            errorBorder: errorTextFieldBorder,
            focusedErrorBorder: errorTextFieldBorder,
            suffix: suffix,
            hintText: hintText,
            hintStyle: DctStyles.b2GreyRegular14,
            errorStyle: DctStyles.b1RedRegular12Roboto,
          ),
          obscuringCharacter: '*',
        );
}
