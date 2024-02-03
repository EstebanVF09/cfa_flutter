import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cfa_movil/blocs/home/home_bloc.dart';
import 'package:cfa_movil/business_logic/entities/catalogs/document_types_entity.dart';
import 'package:cfa_movil/config/theme/app_theme.dart';
import 'package:cfa_movil/presentation/widgets/buttons/dynamic_key_button_widget.dart';
import 'package:cfa_movil/presentation/widgets/buttons/primary_button_widget.dart';
import 'package:cfa_movil/presentation/widgets/buttons/secundary_button_widget.dart';
import 'package:cfa_movil/presentation/widgets/text_form_fields/document_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previousState, currentState) {
        return previousState.formStatus != currentState.formStatus;
      },
      listener: (context, state) {
        if (state.formStatus == FormStatusHome.errorService) {}
      },
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

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
                _buildDinamycKeyButton(context),
                const SizedBox(height: 20),
                _buildTextFormFieldDocumentType(),
                _buildTextFormFieldDocumentType2(context),
                const SizedBox(height: 20),
                _buildTextFormFieldDocument(context),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildBiometricsButton(context),
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

  Align _buildDinamycKeyButton(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 200,
        child: DynamicKeyButtonWidget(
          onPressed: () {
            context.read<HomeBloc>().add(GetDocumentTypesService());
          },
        ),
      ),
    );
  }

  TextFormField _buildTextFormFieldDocumentType() {
    return TextFormField(
      decoration: const InputDecoration(
          suffixIcon: Icon(Icons.arrow_drop_down),
          label: Text('Tipo de documento')),
    );
  }

  Widget _buildTextFormFieldDocumentType2(BuildContext context) {
    List<DataDocumentTypesEntity> documentTypesEntity =
        context.select((HomeBloc value) => value.state.documentTypesEntity);

    DataDocumentTypesEntity selectedOption = documentTypesEntity.isNotEmpty
        ? documentTypesEntity[0]
        : DataDocumentTypesEntity();

    return DropdownButton<DataDocumentTypesEntity>(
      value: selectedOption,
      onChanged: (DataDocumentTypesEntity? newValue) {
        if (newValue != null) {
          //bloc.add(UpdateDocumentType(newValue));
        }
      },
      items: documentTypesEntity.map<DropdownMenuItem<DataDocumentTypesEntity>>(
          (DataDocumentTypesEntity value) {
        return DropdownMenuItem<DataDocumentTypesEntity>(
          value: value,
          child: Text(value.descripcion ?? ''),
        );
      }).toList(),
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

  IconButton _buildBiometricsButton(BuildContext context) {
    return IconButton.filled(
        color: Colors.black,
        iconSize: 50,
        style: IconButton.styleFrom(
          backgroundColor: Colors.grey.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          context.read<HomeBloc>().add(GetDocumentTypesService());
        },
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
      buildWhen: (previousState, currentState) {
        return previousState.banners != currentState.banners;
      },
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
