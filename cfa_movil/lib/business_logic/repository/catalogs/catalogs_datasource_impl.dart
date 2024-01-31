import 'package:cfa_movil/business_logic/datasource/catalogs/catalogs_datasource.dart';
import 'package:cfa_movil/business_logic/entities/catalogs/document_types_entity.dart';
import 'package:cfa_movil/business_logic/repository/catalogs/catalogs_repository.dart';

class CatalogsRepositoryImpl implements CatalogsRepository {
  final CatalogsDataSource dataSource;

  CatalogsRepositoryImpl({required this.dataSource});

  @override
  Future<DocumentTypesEntity> getDocumentTypesService() async {
    final response = dataSource.getDocumentTypesService();
    return response;
  }
}
