import 'package:cfa_movil/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppBarWidget {
  AppBar getAppBarWidget() => AppBar(
      backgroundColor: appBarColor,
      elevation: 1,
      flexibleSpace: Center(
        child: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/icon_header_bar.png'),
          ),
        ),
      ));
}
