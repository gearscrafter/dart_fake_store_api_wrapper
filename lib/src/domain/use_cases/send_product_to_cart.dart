// La clase `SendProductToCart` representa el caso de uso para enviar un producto al carrito.

import 'package:dartz/dartz.dart';

import '../../../dart_fake_store_api_wrapper.dart';
import '../../core/errors/failures.dart';
import '../repositories/cart_repository.dart';

class SendProductToCart {
  final CartRepository repository;
  SendProductToCart(this.repository);

  Future<Either<Failure, CartEntity>> call(CartEntity cart) async {
    return await repository.sendProductToCart(cart);
  }
}
