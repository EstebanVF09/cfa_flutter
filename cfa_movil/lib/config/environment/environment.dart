import 'package:flutter_dotenv/flutter_dotenv.dart';

enum WorkspaceEnvironments { dev, prod }

class Environment {
  final WorkspaceEnvironments environment;

  Environment({this.environment = WorkspaceEnvironments.dev}) {
    initEnvironment();
  }

  Future<void> initEnvironment() async {
    await dotenv.load();
  }

  String get apiCatalogoTiposDocumento =>
      '${dotenv.env['PUBLIC_API_URL_BASE']!}/Catalogos?entidad=CatalogoTiposdocumento';

  String get apiGetBanner => '${dotenv.env['API_URL_BASE']!}/GetBanner';
}
