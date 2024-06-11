// `ShoppingCartApplication` es una clase de aplicación que actúa como intermediaria entre la lógica de negocio
// y la presentación de datos en una aplicación que utiliza la Fake Store API.
// Proporciona métodos para obtener una lista de productos, obtener detalles de un producto,
// y enviar productos al carrito de compras.
//
// Este servicio encapsula la lógica de aplicación y simplifica la interacción con la API para la capa de presentación
// o para otros servicios de la aplicación.
//
// ### Atributos:
// - `getProducts`: Un caso de uso para obtener una lista de productos.
// - `getSingleProduct`: Un caso de uso para obtener un solo producto por su ID.
// - `sendProduct`: Un caso de uso para enviar productos al carrito de compras.
//
// ### Métodos:
// - `fetchProducts()`: Obtiene y muestra una lista de productos.
// - `fetchSingleProduct(int productId)`: Obtiene y muestra los detalles de un solo producto por su ID.
// - `sendProductToCart(CartEntity cart)`: Envía un producto al carrito de compras al servidor.

import 'package:dartz/dartz.dart';

import '../core/errors/failures.dart';
import '../domain/entities/cart_entity.dart';
import '../domain/entities/product_entity.dart';
import '../domain/use_cases/products.dart';

class ShoppingCartApplication {
  final Products useCase;
  ShoppingCartApplication(this.useCase);

  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async {
    return await useCase.callProducts();
  }

  Future<Either<Failure, ProductEntity>> fetchSingleProduct(
      int productId) async {
    return await useCase.callSingleProduct(productId);
  }

  Future<Either<Failure, CartEntity>> sendProductToCart(CartEntity cart) async {
    return await useCase.callSendProduct(cart);
  }
}
