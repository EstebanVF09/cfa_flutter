import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DocumentTextFormFieldWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const DocumentTextFormFieldWidget({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    const border = UnderlineInputBorder();

    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.grey),
      maxLength: 12,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      decoration: InputDecoration(
        hintText: hint,
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        isDense: true,
        label: Text(label ?? ''),
        focusColor: colors.primary,
        errorText: errorMessage,
      ),
    );
  }
}
