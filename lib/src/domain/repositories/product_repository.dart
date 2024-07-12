// La interfaz `ProductsRepository` define un contrato para el repositorio que maneja la lógica relacionada con los productos.

import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/product_entity.dart';

/// La interfaz `ProductsRepository` define los métodos que debe implementar cualquier repositorio de productos.
abstract class ProductsRepository {
  /// Obtiene una lista de productos.
  ///
  /// Devuelve un `Future` que resuelve a un `Either` conteniendo un `Failure` en caso de error,
  /// o una lista de `ProductEntity` en caso de éxito.
  Future<Either<Failure, List<ProductEntity>>> getProducts();

  /// Obtiene un producto específico por su identificador.
  ///
  /// - [productId]: El identificador del producto.
  ///
  /// Devuelve un `Future` que resuelve a un `Either` conteniendo un `Failure` en caso de error,
  /// o una instancia de `ProductEntity` en caso de éxito.
  Future<Either<Failure, ProductEntity>> getSingleProduct(int productId);

  /// Obtiene una lista de categorías de productos.
  ///
  /// Devuelve un `Future` que resuelve a un `Either` conteniendo un `Failure` en caso de error,
  /// o una lista de cadenas (`List<String>`) en caso de éxito.
  Future<Either<Failure, List<String>>> getCategories();
}
