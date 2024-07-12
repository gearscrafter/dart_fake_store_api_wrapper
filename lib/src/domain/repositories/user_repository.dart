import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/user_entity.dart';

/// La interfaz `UserRepository` define los métodos que debe implementar cualquier repositorio de usuarios.
abstract class UserRepository {
  /// Registra un nuevo usuario.
  ///
  /// - [user]: Una instancia de `UserEntity` que representa los datos del usuario a registrar.
  ///
  /// Devuelve un `Future` que resuelve a un `Either` conteniendo un `Failure` en caso de error,
  /// o una instancia de `IdEntity` con el ID del usuario registrado en caso de éxito.
  Future<Either<Failure, IdEntity>> register(UserEntity user);

  /// Inicia sesión de un usuario.
  ///
  /// - [user]: Una instancia de `UserEntity` que representa los datos del usuario para iniciar sesión.
  ///
  /// Devuelve un `Future` que resuelve a un `Either` conteniendo un `Failure` en caso de error,
  /// o una instancia de `TokenEntity` con el token de autenticación en caso de éxito.
  Future<Either<Failure, TokenEntity>> signIn(UserEntity user);

  /// Obtiene la información de un usuario.
  ///
  /// - [idUser]: El identificador del usuario.
  ///
  /// Devuelve un `Future` que resuelve a un `Either` conteniendo un `Failure` en caso de error,
  /// o una instancia de `UserEntity` con la información del usuario en caso de éxito.
  Future<Either<Failure, UserEntity>> getInfo(String idUser);
}
