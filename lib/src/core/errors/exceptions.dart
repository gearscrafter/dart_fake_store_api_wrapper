/// `ServerException` es una clase que implementa `Exception` y representa un error en el servidor.
///
/// Tiene los siguientes atributos:
/// - `message`: Un mensaje opcional que describe el error, por defecto es 'Error en el servidor'.
class ServerException implements Exception {
  /// Un mensaje opcional que describe el error.
  final String message;

  /// Constructor para crear una instancia de `ServerException`.
  ///
  /// - [message]: Un mensaje opcional que describe el error.
  ServerException([this.message = 'Error en el servidor']);

  @override
  String toString() => message;
}

/// `CacheException` es una clase que implementa `Exception` y representa un error de caché.
///
/// Tiene los siguientes atributos:
/// - `message`: Un mensaje opcional que describe el error, por defecto es 'Error de caché'.
class CacheException implements Exception {
  /// Un mensaje opcional que describe el error.
  final String message;

  /// Constructor para crear una instancia de `CacheException`.
  ///
  /// - [message]: Un mensaje opcional que describe el error.
  CacheException([this.message = 'Error de caché']);

  @override
  String toString() => message;
}

/// `GeneralException` es una clase que implementa `Exception` y representa un error general.
///
/// Tiene los siguientes atributos:
/// - `message`: Un mensaje opcional que describe el error, por defecto es 'Ocurrió un problema, por favor intente nuevamente'.
class GeneralException implements Exception {
  /// Un mensaje opcional que describe el error.
  final String message;

  /// Constructor para crear una instancia de `GeneralException`.
  ///
  /// - [message]: Un mensaje opcional que describe el error.
  GeneralException(
      {this.message = 'Ocurrió un problema, por favor intente nuevamente'});

  @override
  String toString() => message;
}
