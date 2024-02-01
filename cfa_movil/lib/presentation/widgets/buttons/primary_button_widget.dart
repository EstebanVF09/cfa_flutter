import 'package:cfa_movil/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButtonWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryButtonColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text.toUpperCase(),
      ),
    );
  }
}
