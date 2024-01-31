import 'package:cfa_movil/config/theme/app_theme.dart';
import 'package:cfa_movil/presentation/widgets/app_bar/app_bar_widget.dart';
import 'package:cfa_movil/presentation/widgets/buttons/dynamic_key_button_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().getAppBarWidget(),
      body: SafeArea(
          child: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'CFA Móvil',
                style: TextStyle(
                    color: principalTextColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200, left: 20),
            child: DynamicKeyButtonWidget(
              onPressed: () {},
            ),
          ),
        ],
      )),
    );
  }
}
