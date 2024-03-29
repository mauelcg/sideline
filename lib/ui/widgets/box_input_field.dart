import 'package:flutter/material.dart';

import '../shared/styles.dart';

class BoxInputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String? labelText;
  final Widget? leading;
  final Widget? trailing;
  final int? minLines;
  final bool expands;
  final int? maxLines;
  final int? maxLength;
  final bool? filled;
  final bool password;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? enabledBorderColor;
  final BoxConstraints? constraints;
  final void Function()? trailingTapped;

  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  BoxInputField({
    Key? key,
    required this.controller,
    this.placeholder = '',
    this.expands = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.password = false,
    this.labelText,
    this.leading,
    this.maxLength,
    this.borderColor,
    this.constraints,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.trailing,
    this.filled,
    this.trailingTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      /// Overriding the default blue color.
      ///
      /// We can also avoid this by changing the [primarySwatch] in MaterialApp
      data: ThemeData(primaryColor: kcPrimaryColor),
      child: TextField(
        expands: expands,
        textAlignVertical: TextAlignVertical.top,
        controller: controller,
        style: const TextStyle(height: 1),
        obscureText: password,
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: placeholder,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          filled: filled ?? true,
          fillColor: kcVeryLightGreyColor,
          prefixIcon: leading,
          constraints: constraints,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: trailing != null
              ? GestureDetector(
                  onTap: trailingTapped,
                  child: trailing,
                )
              : null,
          border: circularBorder.copyWith(
            borderSide: BorderSide(color: borderColor ?? kcLightGreyColor),
          ),
          errorBorder: circularBorder.copyWith(
            borderSide: BorderSide(color: errorBorderColor ?? Colors.red),
          ),
          focusedBorder: circularBorder.copyWith(
            borderSide: BorderSide(color: focusedBorderColor ?? kcPrimaryColor),
          ),
          enabledBorder: circularBorder.copyWith(
            borderSide: BorderSide(color: enabledBorderColor ?? kcLightGreyColor),
          ),
        ),
      ),
    );
  }
}
