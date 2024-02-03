import 'package:flutter/material.dart';

class DocumentTextFormFieldWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const DocumentTextFormFieldWidget({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    const border = UnderlineInputBorder();

    return TextFormField(
      style: const TextStyle(color: Colors.grey),
      maxLength: 12,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        label: Text(label ?? ''),
        focusColor: colors.primary,
        errorText: errorMessage,
      ),
    );
  }
}
