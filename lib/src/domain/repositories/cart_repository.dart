// La interfaz `CartRepository` define un contrato para el repositorio que maneja la lógica de enviar productos al carrito.

import 'package:dartz/dartz.dart';
import '../../../dart_fake_store_api_wrapper.dart';
import '../../core/errors/failures.dart';

/// La interfaz `CartRepository` define los métodos que debe implementar cualquier repositorio de carrito de compras.
abstract class CartRepository {
  /// Envía un producto al carrito.
  ///
  /// - [cart]: Una instancia de `CartEntity` que representa el carrito con los productos a enviar.
  ///
  /// Devuelve un `Future` que resuelve a un `Either` conteniendo un `Failure` en caso de error,
  /// o un `CartEntity` actualizado en caso de éxito.
  Future<Either<Failure, CartEntity>> sendProductToCart(CartEntity cart);
}
