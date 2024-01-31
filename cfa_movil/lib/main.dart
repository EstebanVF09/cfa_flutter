import 'package:cfa_movil/blocs/home/home_bloc.dart';
import 'package:cfa_movil/config/router/app_router.dart';
import 'package:cfa_movil/config/theme/app_theme.dart';
import 'package:cfa_movil/setup_dependency_injection/setup_dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  setUpDependencyInjection();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppRouter>(create: (context) => getIt<AppRouter>()),
        BlocProvider<HomeBloc>(create: (context) => getIt<HomeBloc>()),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<AppRouter>();
    return MaterialApp.router(
        routerConfig: appRouter.state,
        theme: AppTheme().getTheme(),
        debugShowCheckedModeBanner: false);
  }
}
