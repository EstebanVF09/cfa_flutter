import 'package:flutter/material.dart';

class DynamicKeyButtonWidget extends StatelessWidget {
  final Function()? onPressed;

  const DynamicKeyButtonWidget({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        onPressed: () {},
        label: const Text('Activar clave dinámica'),
        icon: Image.asset(
          'assets/images/activar_clave.png',
          scale: 3,
        ));
  }
}
