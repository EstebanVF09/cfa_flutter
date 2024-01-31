import 'package:cfa_movil/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DynamicKeyButtonWidget extends StatelessWidget {
  final Function()? onPressed;

  const DynamicKeyButtonWidget({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
         side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(color: Colors.grey),
      ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size.fromHeight(50.0),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.block,
            color: principalTextColor,
            size: 40,
          ),
          Expanded(
            child: Text(
              'Activar clave dinámica',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: principalTextColor,
                fontSize: 20,
              ),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
