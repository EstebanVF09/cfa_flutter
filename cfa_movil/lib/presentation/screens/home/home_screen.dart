import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cfa_movil/blocs/home/home_bloc.dart';
import 'package:cfa_movil/config/theme/app_theme.dart';
import 'package:cfa_movil/presentation/widgets/app_bar/app_bar_widget.dart';
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
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(colors.primary, context),
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
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 200,
                child: DynamicKeyButtonWidget(
                  onPressed: () {},
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  label: Text('Tipo de documento')),
            ),
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
            SizedBox(
              width: 200,
              child: SecondaryButtonWidget(
                text: 'continuar',
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 200,
              child: PrimaryButtonWidget(
                text: 'registrarse',
                onPressed: () {},
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _buildBanners(context),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildBanners(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            aspectRatio: 3,
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

  NavigationBar _buildBottomNavigationBar(Color color, BuildContext context) {
    return NavigationBar(
      indicatorColor: color,
      selectedIndex: 0,
      destinations: <Widget>[
        _buildButtonNavigation(
          color,
          Icons.waves_outlined,
          'Inicio',
        ),
        _buildButtonNavigation(
          color,
          Icons.info_outline,
          'Productos Virtuales',
        ),
        _buildButtonNavigation(
          color,
          Icons.public,
          'Contáctenos',
        ),
        _buildButtonNavigation(
          color,
          Icons.flag_outlined,
          'Oficinas',
        ),
      ],
      onDestinationSelected: (value) => onItemTapped(value, context),
    );
  }

  void onItemTapped(int index, BuildContext context) {}
  NavigationDestination _buildButtonNavigation(
      Color color, IconData icon, String text) {
    return NavigationDestination(
        selectedIcon: Icon(icon, color: Colors.white),
        icon: Icon(icon, color: color),
        label: text);
  }
}
