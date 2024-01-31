import 'dart:convert';

import 'package:cfa_movil/business_logic/datasource/catalogs/catalogs_datasource.dart';
import 'package:cfa_movil/business_logic/entities/catalogs/document_types_entity.dart';
import 'package:cfa_movil/business_logic/mappers/catalogs/document_types_mapper.dart';
import 'package:cfa_movil/config/environment/environment.dart';
import 'package:cfa_movil/utils/api_client/api_client.dart';

class CatalogsDataSourceImpl implements CatalogsDataSource {
  final ApiClient clientHttp;
  final Environment environment;

  CatalogsDataSourceImpl({required this.clientHttp, required this.environment});

  @override
  Future<DocumentTypesEntity> getDocumentTypesService() async {
    final response =
        await clientHttp.get(environment.apiCatalogoTiposDocumento);

    final dynamic jsonResponse = jsonDecode(response.data);

    final jsonResponseData =
        DocumentTypesMapper.fromJson(jsonResponse).toEntity();

    return jsonResponseData;
  }
}
