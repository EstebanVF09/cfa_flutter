import 'package:cfa_movil/blocs/home/home_bloc.dart';
import 'package:cfa_movil/config/theme/app_theme.dart';
import 'package:cfa_movil/presentation/widgets/app_bar/app_bar_widget.dart';
import 'package:cfa_movil/presentation/widgets/buttons/dynamic_key_button_widget.dart';
import 'package:cfa_movil/presentation/widgets/text_form_fields/document_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final HomeBloc homeBloc;

  const HomeScreen({
    super.key,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().getAppBarWidget(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
              padding: const EdgeInsets.only(
                right: 200,
              ),
              child: DynamicKeyButtonWidget(
                onPressed: () {},
              ),
            ),
            TextFormField(),
            DocumentTextFormFieldWidget(
              label: 'Número de documento',
              onChanged: (value) {
                context
                    .read<HomeBloc>()
                    .add(SetIdentification(identification: value));
                if (value.length >= 12) {
                  FocusScope.of(context).unfocus();
                }
              },
              errorMessage: context.select(
                  (HomeBloc value) => value.state.identification.errorMessage),
            ),
          ],
        ),
      )),
    );
  }
}
