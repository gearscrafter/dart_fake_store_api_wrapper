class ServerException implements Exception {
  final String message;

  ServerException([this.message = 'Error en el servidor']);

  @override
  String toString() => message;
}

class CacheException implements Exception {
  final String message;

  CacheException([this.message = 'Error de caché']);

  @override
  String toString() => message;
}

class GeneralException implements Exception {
  final String message;

  GeneralException(
      {this.message = 'Ocurrió un problema, por favor intente nuevamente'});

  @override
  String toString() => message;
}
