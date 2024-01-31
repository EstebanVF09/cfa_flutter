class NoConnectionException implements Exception {
  final String message;

  NoConnectionException(
      {this.message =
          'Existen problemas de conectividad. Por favor inténtelo de nuevo.'});
}
