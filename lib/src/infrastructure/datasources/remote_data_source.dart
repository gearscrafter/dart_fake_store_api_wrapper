// `RemoteDataSource` es una interfaz abstracta que define métodos para interactuar con la Fake Store API y obtener datos relacionados con productos y carritos.
// Las implementaciones concretas de esta interfaz deben proporcionar la lógica para realizar solicitudes HTTP y procesar las respuestas.
// `RemoteDataSourceImpl` es una implementación concreta de la interfaz `RemoteDataSource`.
// Utiliza un cliente API (`ApiClient`) para realizar solicitudes HTTP a la Fake Store API y procesar las respuestas.

import 'package:dart_fake_store_api_wrapper/src/domain/entities/user_entity.dart';
import 'package:http/http.dart' as http;

import '../../../dart_fake_store_api_wrapper.dart';
import '../../core/errors/exceptions.dart';
import '../../core/network/api_client.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';

abstract class RemoteDataSource {
  // Obtiene una lista de productos desde la API.
  Future<List<ProductEntity>> getProducts();

  // Obtiene un producto específico por su identificador desde la API.
  Future<ProductEntity> getSingleProduct(int productId);

  // Envía un producto a la API y devuelve el carrito actualizado.
  Future<CartEntity> sendProductToCart(CartEntity cart);

  Future<IdEntity> registerUser(UserEntity user);

  Future<TokenEntity> signInUser(UserEntity user);

  Future<UserEntity> getInfoUser(String idUser);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient _apiClient;
  RemoteDataSourceImpl(this._apiClient);
  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      final dynamic data = await _apiClient.get('products');
      return (data as List).map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      if (e is http.ClientException) {
        throw GeneralException(message: 'Error de red: ${e.message}');
      } else {
        throw GeneralException(message: 'Error inesperado: ${e.toString()}');
      }
    }
  }

  @override
  Future<ProductEntity> getSingleProduct(int productId) async {
    try {
      final dynamic data = await _apiClient.get('products/$productId');
      return ProductModel.fromJson(data);
    } catch (e) {
      if (e is http.ClientException) {
        throw GeneralException(message: 'Error de red: ${e.message}');
      } else {
        throw GeneralException(message: 'Error inesperado: ${e.toString()}');
      }
    }
  }

  @override
  Future<CartEntity> sendProductToCart(CartEntity cartData) async {
    try {
      final cartProducts = <ProductQuantityModel>[];
      for (var product in cartData.products) {
        cartProducts.add(ProductQuantityModel(
            productId: product.productId, quantity: product.quantity));
      }
      final model = CartModel(
          id: cartData.id,
          userId: cartData.userId,
          date: cartData.date,
          products: cartProducts);
      final dynamic data = await _apiClient.post('carts/', model.toJson());
      return CartModel.fromJson(data);
    } catch (e) {
      if (e is http.ClientException) {
        throw GeneralException(message: 'Error de red: ${e.message}');
      } else {
        throw GeneralException(message: 'Error inesperado: ${e.toString()}');
      }
    }
  }

  @override
  Future<UserEntity> getInfoUser(String idUser) async {
    try {
      final dynamic data = await _apiClient.get('users/$idUser');
      return UserModel.fromJson(data);
    } catch (e) {
      if (e is http.ClientException) {
        throw GeneralException(message: 'Error de red: ${e.message}');
      } else {
        throw GeneralException(message: 'Error inesperado: ${e.toString()}');
      }
    }
  }

  @override
  Future<IdEntity> registerUser(UserEntity user) async {
    try {
      final model = UserModel(
        username: user.username,
        password: user.password,
      );
      final dynamic data = await _apiClient.post('auth/login', model.toJson());
      return IdModel.fromJson(data);
    } catch (e) {
      if (e is http.ClientException) {
        throw GeneralException(message: 'Error de red: ${e.message}');
      } else {
        throw GeneralException(message: 'Error inesperado: ${e.toString()}');
      }
    }
  }

  @override
  Future<TokenEntity> signInUser(UserEntity user) async {
    try {
      final model = UserModel(
          username: user.username,
          password: user.password,
          address: user.address,
          email: user.email,
          name: user.name,
          phone: user.phone);
      final dynamic data = await _apiClient.post('users', model.toJson());
      return TokenModel.fromJson(data);
    } catch (e) {
      if (e is http.ClientException) {
        throw GeneralException(message: 'Error de red: ${e.message}');
      } else {
        throw GeneralException(message: 'Error inesperado: ${e.toString()}');
      }
    }
  }
}
