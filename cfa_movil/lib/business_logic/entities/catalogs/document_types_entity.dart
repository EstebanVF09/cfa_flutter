class DocumentTypesEntity {
  final bool? exitoso;
  final String? codigoError;
  final String? descripcionError;
  final List<DataDocumentTypesEntity>? data;

  DocumentTypesEntity({
    this.exitoso,
    this.codigoError,
    this.descripcionError,
    this.data,
  });
}

class DataDocumentTypesEntity {
  final String? codigo;
  final String? descripcion;

  DataDocumentTypesEntity({
    this.codigo,
    this.descripcion,
  });
}
