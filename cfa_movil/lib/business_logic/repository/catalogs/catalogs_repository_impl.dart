import 'package:cfa_movil/business_logic/datasource/catalogs/catalogs_datasource.dart';
import 'package:cfa_movil/business_logic/entities/catalogs/document_types_entity.dart';
import 'package:cfa_movil/business_logic/repository/catalogs/catalogs_repository.dart';
import 'package:cfa_movil/utils/connection_validator/connection_validator.dart';

class CatalogsRepositoryImpl implements CatalogsRepository {
  final CatalogsDataSource dataSource;
  final ConnectionValidator connectionValidator;

  CatalogsRepositoryImpl(
      {required this.dataSource, required this.connectionValidator});

  @override
  Future<DocumentTypesEntity> getDocumentTypesService() async {
    await connectionValidator.isConnectedToTheInternet();

    final response = dataSource.getDocumentTypesService();
    return response;
  }

  @override
  Future<List<String>> getBannerService() async {
    await connectionValidator.isConnectedToTheInternet();

    final response = dataSource.getBannerService();
    return response;
  }
}
