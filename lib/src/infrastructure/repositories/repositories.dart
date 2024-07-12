// La clase `Repositories` implementa los repositorios de carrito y productos.
// Utiliza un `RemoteDataSource` para realizar operaciones en la capa de data source.

import 'package:dartz/dartz.dart';
import '../../../dart_fake_store_api_wrapper.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote_data_source.dart';

/// La clase `Repositories` implementa las interfaces `CartRepository`, `ProductsRepository` y `UserRepository`.
///
/// Utiliza un `RemoteDataSource` para realizar operaciones en la capa de data source.
class Repositories
    implements CartRepository, ProductsRepository, UserRepository {
  /// Fuente de datos remota utilizada para interactuar con la API.
  final RemoteDataSource remoteDataSource;

  /// Constructor que recibe una instancia de `RemoteDataSource`.
  Repositories(this.remoteDataSource);

  @override
  Future<Either<Failure, CartEntity>> sendProductToCart(CartEntity cart) async {
    try {
      final products = await remoteDataSource.sendProductToCart(cart);
      return Right(products);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure('Error en el servidor'));
      } else if (e is CacheException) {
        return Left(CacheFailure('Error de caché'));
      } else {
        return Left(GeneralFailure('Error inesperado: ${e.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();
      return Right(products);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure('Error en el servidor'));
      } else if (e is CacheException) {
        return Left(CacheFailure('Error de caché'));
      } else {
        return Left(GeneralFailure('Error inesperado: ${e.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getSingleProduct(int productId) async {
    try {
      final product = await remoteDataSource.getSingleProduct(productId);
      return Right(product);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure('Error en el servidor'));
      } else if (e is CacheException) {
        return Left(CacheFailure('Error de caché'));
      } else {
        return Left(GeneralFailure('Error inesperado: ${e.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getInfo(String idUser) async {
    try {
      final user = await remoteDataSource.getInfoUser(idUser);
      return Right(user);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure('Error en el servidor'));
      } else if (e is CacheException) {
        return Left(CacheFailure('Error de caché'));
      } else {
        return Left(GeneralFailure('Error inesperado: ${e.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, IdEntity>> register(UserEntity userData) async {
    try {
      final user = await remoteDataSource.registerUser(userData);
      return Right(user);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure('Error en el servidor'));
      } else if (e is CacheException) {
        return Left(CacheFailure('Error de caché'));
      } else {
        return Left(GeneralFailure('Error inesperado: ${e.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, TokenEntity>> signIn(UserEntity userData) async {
    try {
      final user = await remoteDataSource.signInUser(userData);
      return Right(user);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure('Error en el servidor'));
      } else if (e is CacheException) {
        return Left(CacheFailure('Error de caché'));
      } else {
        return Left(GeneralFailure('Error inesperado: ${e.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure('Error en el servidor'));
      } else if (e is CacheException) {
        return Left(CacheFailure('Error de caché'));
      } else {
        return Left(GeneralFailure('Error inesperado: ${e.toString()}'));
      }
    }
  }
}
