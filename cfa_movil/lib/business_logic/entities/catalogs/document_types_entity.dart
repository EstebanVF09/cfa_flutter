class DocumentTypesEntity {
  final bool? exitoso;
  final String? codigoError;
  final String? descripcionError;
  final List<DatumEntity>? data;

  DocumentTypesEntity({
    this.exitoso,
    this.codigoError,
    this.descripcionError,
    this.data,
  });
}

class DatumEntity {
  final String? codigo;
  final String? descripcion;

  DatumEntity({
    this.codigo,
    this.descripcion,
  });
}
