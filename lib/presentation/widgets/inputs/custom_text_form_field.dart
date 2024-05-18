import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    final boder = OutlineInputBorder(borderRadius: BorderRadius.circular(15));
    final colors = Theme.of(context).colorScheme;
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        enabledBorder: boder,
        focusedBorder:
            boder.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder:
            boder.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder:
            boder.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        errorText: errorMessage,
      ),
    );
  }
}
