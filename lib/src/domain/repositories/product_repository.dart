// La interfaz `ProductsRepository` define un contrato para el repositorio que maneja la lógica relacionada con los productos.
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/product_entity.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, ProductEntity>> getSingleProduct(int productId);
}
