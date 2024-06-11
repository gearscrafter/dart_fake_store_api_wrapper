// La clase `GetSingleProduct` representa el caso de uso para obtener un producto.

import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetSingleProduct {
  final ProductsRepository repository;

  GetSingleProduct(this.repository);

  Future<Either<Failure, ProductEntity>> call(int productId) async {
    return await repository.getSingleProduct(productId);
  }
}
