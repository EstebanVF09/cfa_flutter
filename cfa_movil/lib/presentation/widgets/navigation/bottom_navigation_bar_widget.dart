import 'package:cfa_movil/cubits/bottom_menu/bottom_menu_cubit.dart';
import 'package:cfa_movil/presentation/screens/home/home_screen.dart';
import 'package:cfa_movil/presentation/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final BottomMenuCubit menuCubit;

  const BottomNavigationBarWidget({
    super.key,
    required this.menuCubit,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _buildBottomNavigationBar(colors.primary, context),
      appBar: AppBarWidget().getAppBarWidget(),
      body: SafeArea(
        child: buildSelectedIndexBottomBar(
          context.select((BottomMenuCubit value) => value.state.selectedIndex),
        ),
      ),
    );
  }

  NavigationBar _buildBottomNavigationBar(Color color, BuildContext context) {
    return NavigationBar(
      indicatorColor: color,
      selectedIndex:
          context.select((BottomMenuCubit value) => value.state.selectedIndex),
      destinations: <Widget>[
        _buildButtonNavigation(
          color,
          Icons.home,
          'Inicio',
        ),
        _buildButtonNavigation(
          color,
          Icons.account_balance_wallet_outlined,
          'Productos Virtuales',
        ),
        _buildButtonNavigation(
          color,
          Icons.contact_support_outlined,
          'Contáctenos',
        ),
        _buildButtonNavigation(
          color,
          Icons.map,
          'Oficinas',
        ),
      ],
      onDestinationSelected: (value) =>
          context.read<BottomMenuCubit>().setIndex(value),
    );
  }

  NavigationDestination _buildButtonNavigation(
      Color color, IconData icon, String text) {
    return NavigationDestination(
        selectedIcon: Icon(icon, color: Colors.white),
        icon: Icon(icon, color: color),
        label: text);
  }

  Widget buildSelectedIndexBottomBar(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return Center(child: Text('Opcion $index'));
      case 2:
        return Center(child: Text('Opcion $index'));
      case 3:
        return Center(child: Text('Opcion $index'));
      default:
        return Center(child: Text('Opcion $index'));
    }
  }
}
