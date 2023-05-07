import 'package:flutter/material.dart';

import 'theme.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscure = false,
    this.onChanged,
    this.enabled = true,
    this.controller,
    this.hint,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
  });

  final suffixIcon;
  final prefixIcon;
  final onChanged;
  final validator;
  final enabled;
  final controller;
  final obscure;
  final hint;
  final textCapitalization;
  final keyboardType;
  final inputFormatters;
  final maxLines;
  final maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      buildCounter: (context,
          {required currentLength, required isFocused, maxLength}) =>
      null,
      inputFormatters: inputFormatters,
      enabled: enabled,
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 15, color: DARK),
      textCapitalization: textCapitalization,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscure,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        filled: false,
        border: InputBorder.none,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: LIGHTGREY, width: 0.6),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: LIGHTGREY, width: 0.6),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: DARK.withOpacity(0.3), width: 0.6),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.redAccent, width: 0.6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: LIGHTGREY, width: 0.6),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hint,
        hintStyle: TextStyle(fontSize: 15, color: DARK.withOpacity(0.5)),
        contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      ),
    );
  }
}
