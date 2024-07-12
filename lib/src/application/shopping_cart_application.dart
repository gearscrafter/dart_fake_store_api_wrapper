// `ShoppingCartApplication` es una clase de aplicación que actúa como intermediaria entre la lógica de negocio
// y la presentación de datos en una aplicación que utiliza la Fake Store API.
// Proporciona métodos para obtener una lista de productos, obtener detalles de un producto,
// y enviar productos al carrito de compras.
//
// Este servicio encapsula la lógica de aplicación y simplifica la interacción con la API para la capa de presentación
// o para otros servicios de la aplicación.
//
// ### Atributos:
// - `productUseCase`: Un caso de uso para manejar la lógica relacionada con productos.
// - `userUseCase`: Un caso de uso para manejar la lógica relacionada con usuarios.
//
// ### Métodos:
// - `fetchProducts()`: Obtiene y muestra una lista de productos.
// - `fetchSingleProduct(int productId)`: Obtiene y muestra los detalles de un solo producto por su ID.
// - `sendProductToCart(CartEntity cart)`: Envía un producto al carrito de compras al servidor.
// - `sendRegister(UserEntity userData)`: Registra un nuevo usuario.
// - `sendSignIn(UserEntity userData)`: Inicia sesión de un usuario.
// - `fetchInfo(String idUser)`: Obtiene la información de un usuario.
// - `fetchCategories()`: Obtiene una lista de categorías de productos.

import 'package:dartz/dartz.dart';
import '../core/errors/failures.dart';
import '../domain/entities/cart_entity.dart';
import '../domain/entities/product_entity.dart';
import '../domain/entities/user_entity.dart';
import '../domain/use_cases/products.dart';
import '../domain/use_cases/users.dart';

/// `ShoppingCartApplication` es la clase de aplicación que facilita la interacción con la API de Fake Store.
class ShoppingCartApplication {
  /// Un caso de uso para manejar la lógica relacionada con productos.
  final Products productUseCase;

  /// Un caso de uso para manejar la lógica relacionada con usuarios.
  final Users userUseCase;

  /// Constructor que recibe los casos de uso de productos y usuarios.
  ShoppingCartApplication(this.productUseCase, this.userUseCase);

  /// Obtiene y devuelve una lista de productos.
  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async {
    return await productUseCase.callProducts();
  }

  /// Obtiene y devuelve los detalles de un solo producto por su ID.
  ///
  /// - [productId]: El ID del producto a obtener.
  Future<Either<Failure, ProductEntity>> fetchSingleProduct(
      int productId) async {
    return await productUseCase.callSingleProduct(productId);
  }

  /// Envía un producto al carrito de compras al servidor.
  ///
  /// - [cart]: La entidad del carrito que contiene los productos a enviar.
  Future<Either<Failure, CartEntity>> sendProductToCart(CartEntity cart) async {
    return await productUseCase.callSendProduct(cart);
  }

  /// Registra un nuevo usuario.
  ///
  /// - [userData]: Los datos del usuario a registrar.
  Future<Either<Failure, IdEntity>> sendRegister(UserEntity userData) async {
    return await userUseCase.callRegister(userData);
  }

  /// Inicia sesión de un usuario.
  ///
  /// - [userData]: Los datos del usuario para iniciar sesión.
  Future<Either<Failure, TokenEntity>> sendSignIn(UserEntity userData) async {
    return await userUseCase.callSignIn(userData);
  }

  /// Obtiene la información de un usuario por su ID.
  ///
  /// - [idUser]: El ID del usuario.
  Future<Either<Failure, UserEntity>> fetchInfo(String idUser) async {
    return await userUseCase.callInfo(idUser);
  }

  /// Obtiene y devuelve una lista de categorías de productos.
  Future<Either<Failure, List<String>>> fetchCategories() async {
    return await productUseCase.callGetCategories();
  }
}
