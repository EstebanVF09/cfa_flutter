import 'package:cfa_movil/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppBarWidget {
  AppBar getAppBarWidget() => AppBar(
        backgroundColor: appBarColor,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Center(
          child: SafeArea(
            child: Container(
                alignment: Alignment.center,
                child: const Icon(Icons.dinner_dining)),
          ),
        ),
      );
}
