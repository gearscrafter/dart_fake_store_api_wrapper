// La interfaz `CartRepository` define un contrato para el repositorio que maneja la lógica de enviar productos al carrito.

import 'package:dartz/dartz.dart';

import '../../../dart_fake_store_api_wrapper.dart';
import '../../core/errors/failures.dart';

abstract class CartRepository {
  Future<Either<Failure, CartEntity>> sendProductToCart(CartEntity cart);
}
