import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cfa_movil/blocs/home/home_bloc.dart';
import 'package:cfa_movil/config/theme/app_theme.dart';
import 'package:cfa_movil/presentation/widgets/buttons/dynamic_key_button_widget.dart';
import 'package:cfa_movil/presentation/widgets/buttons/primary_button_widget.dart';
import 'package:cfa_movil/presentation/widgets/buttons/secundary_button_widget.dart';
import 'package:cfa_movil/presentation/widgets/text_form_fields/document_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatelessWidget {
  final HomeBloc homeBloc;

  const HomeScreen({
    super.key,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          _buildTitle(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildDinamycKeyButton(),
                const SizedBox(height: 20),
                _buildTextFormFieldDocuementType(),
                const SizedBox(height: 20),
                _buildTextFormFieldDocument(context),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildBiometricsButton(),
          const SizedBox(height: 20),
          _buildPrimaryButton(),
          _buildSecondaryButton(),
          const SizedBox(height: 40),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildBanners(context),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Center _buildTitle() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'CFA Móvil',
          style:
              TextStyle(color: principalTextColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Align _buildDinamycKeyButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 200,
        child: DynamicKeyButtonWidget(
          onPressed: () {},
        ),
      ),
    );
  }

  TextFormField _buildTextFormFieldDocuementType() {
    return TextFormField(
      decoration: const InputDecoration(
          suffixIcon: Icon(Icons.arrow_drop_down),
          label: Text('Tipo de documento')),
    );
  }

  DocumentTextFormFieldWidget _buildTextFormFieldDocument(
      BuildContext context) {
    return DocumentTextFormFieldWidget(
      label: 'Número de documento',
      onChanged: (value) {
        context.read<HomeBloc>().add(SetIdentification(identification: value));
        if (value.length >= 12) {
          FocusScope.of(context).unfocus();
        }
      },
      errorMessage: context
          .select((HomeBloc value) => value.state.identification.errorMessage),
    );
  }

  IconButton _buildBiometricsButton() {
    return IconButton.filled(
        color: Colors.black,
        iconSize: 50,
        style: IconButton.styleFrom(
          backgroundColor: Colors.grey.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {},
        icon: const Icon(Icons.fingerprint));
  }

  SizedBox _buildPrimaryButton() {
    return SizedBox(
      width: 200,
      child: SecondaryButtonWidget(
        text: 'continuar',
        onPressed: () {},
      ),
    );
  }

  SizedBox _buildSecondaryButton() {
    return SizedBox(
      width: 200,
      child: PrimaryButtonWidget(
        text: 'registrarse',
        onPressed: () {},
      ),
    );
  }

  Widget _buildBanners(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            aspectRatio: 2.5,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
          ),
          items: state.banners.map((banner) {
            return _buildBannerImage(banner);
          }).toList(),
        );
      },
    );
  }

  CachedNetworkImage _buildBannerImage(String fileUrl) {
    return CachedNetworkImage(
      imageUrl: '${dotenv.env['URL_SERVER_FOR_RESOURCES']!}/$fileUrl',
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
