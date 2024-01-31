import 'package:cfa_movil/business_logic/entities/catalogs/document_types_entity.dart';

class DocumentTypesMapper {
  final bool? exitoso;
  final String? codigoError;
  final String? descripcionError;
  final List<DatumMapper>? data;

  DocumentTypesMapper({
    this.exitoso,
    this.codigoError,
    this.descripcionError,
    this.data,
  });

  factory DocumentTypesMapper.fromJson(Map<String, dynamic> json) =>
      DocumentTypesMapper(
        exitoso: json["Exitoso"],
        codigoError: json["Codigo_Error"],
        descripcionError: json["Descripcion_Error"],
        data: json["Data"] == null
            ? []
            : List<DatumMapper>.from(
                json["Data"]!.map((x) => DatumMapper.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Exitoso": exitoso,
        "Codigo_Error": codigoError,
        "Descripcion_Error": descripcionError,
        "Data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };

  DocumentTypesEntity toEntity() => DocumentTypesEntity(
      exitoso: exitoso,
      codigoError: codigoError,
      descripcionError: descripcionError,
      data: data?.map((e) => e.toEntity()).toList());
}

class DatumMapper {
  final String? codigo;
  final String? descripcion;

  DatumMapper({
    this.codigo,
    this.descripcion,
  });

  factory DatumMapper.fromJson(Map<String, dynamic> json) => DatumMapper(
        codigo: json["Codigo"],
        descripcion: json["Descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "Codigo": codigo,
        "Descripcion": descripcion,
      };

  DatumEntity toEntity() =>
      DatumEntity(codigo: codigo, descripcion: descripcion);
}
