/// `Failure` es una clase abstracta que representa una falla genérica en la aplicación.
///
/// Tiene los siguientes atributos:
/// - `message`: Un mensaje que describe la falla.
abstract class Failure {
  /// Un mensaje que describe la falla.
  final String message;

  /// Constructor para crear una instancia de `Failure`.
  Failure(this.message);

  @override
  String toString() => message;
}

/// `ServerFailure` es una clase que extiende `Failure` y representa una falla en el servidor.
///
/// Hereda el atributo `message` de la clase `Failure`.
class ServerFailure extends Failure {
  /// Constructor para crear una instancia de `ServerFailure`.
  ///
  /// - [message]: Un mensaje que describe la falla en el servidor.
  ServerFailure(super.message);
}

/// `CacheFailure` es una clase que extiende `Failure` y representa una falla en la caché.
///
/// Hereda el atributo `message` de la clase `Failure`.
class CacheFailure extends Failure {
  /// Constructor para crear una instancia de `CacheFailure`.
  ///
  /// - [message]: Un mensaje que describe la falla en la caché.
  CacheFailure(super.message);
}

/// `GeneralFailure` es una clase que extiende `Failure` y representa una falla general.
///
/// Hereda el atributo `message` de la clase `Failure`.
class GeneralFailure extends Failure {
  /// Constructor para crear una instancia de `GeneralFailure`.
  ///
  /// - [message]: Un mensaje que describe la falla general.
  GeneralFailure(super.message);
}
