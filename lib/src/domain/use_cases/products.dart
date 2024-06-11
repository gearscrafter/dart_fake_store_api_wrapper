import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/cart_entity.dart';
import '../entities/product_entity.dart';
import '../repositories/cart_repository.dart';
import '../repositories/product_repository.dart';

class Products {
  final ProductsRepository productRepository;
  final CartRepository cartRepository;

  Products(this.productRepository, this.cartRepository);

  Future<Either<Failure, List<ProductEntity>>> callProducts() async {
    return await productRepository.getProducts();
  }

  Future<Either<Failure, ProductEntity>> callSingleProduct(
      int productId) async {
    return await productRepository.getSingleProduct(productId);
  }

  Future<Either<Failure, CartEntity>> callSendProduct(CartEntity cart) async {
    return await cartRepository.sendProductToCart(cart);
  }
}
