import 'package:formz/formz.dart';

enum IdentificationError { empty, maxLength, minLength }

class Identification extends FormzInput<String, IdentificationError> {
  const Identification.pure() : super.pure('');

  const Identification.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == IdentificationError.empty) return 'El campo es requerido';
    if (displayError == IdentificationError.maxLength) return 'Máximo 12 caracteres';
    if (displayError == IdentificationError.minLength) return 'Mínimo 1 caracter';

    return null;
  }

  @override
  IdentificationError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return IdentificationError.empty;
    if (value.length > 12) return IdentificationError.maxLength;
    return null;
  }
}