// La clase `Repositories` implementa los repositorios de carrito y productos.
// Utiliza un `RemoteDataSource` para realizar operaciones en la capa de data source.

import 'package:dartz/dartz.dart';

import '../../../dart_fake_store_api_wrapper.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/remote_data_source.dart';

class Repositories implements CartRepository, ProductsRepository {
  final RemoteDataSource remoteDataSource;

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
}
