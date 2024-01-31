import 'package:cfa_movil/business_logic/entities/catalogs/document_types_entity.dart';

abstract class CatalogsRepository {
  Future<DocumentTypesEntity> getDocumentTypesService();
}
