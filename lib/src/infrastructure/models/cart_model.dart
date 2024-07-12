import '../../domain/entities/cart_entity.dart';

/// La clase `CartModel` extiende la clase `CartEntity` del dominio y representa un modelo de carrito en el contexto del paquete.
class CartModel extends CartEntity {
  /// Constructor para crear una instancia de `CartModel`.
  ///
  /// - [id]: ID del carrito (opcional).
  /// - [userId]: ID del usuario asociado al carrito.
  /// - [date]: Fecha de creación del carrito.
  /// - [products]: Lista de productos en el carrito.
  CartModel({
    int? id,
    required super.userId,
    required super.date,
    required List<ProductQuantityModel> super.products,
  });

  /// Crea una instancia de `CartModel` a partir de un mapa JSON.
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      date: (json['date'] is String) ? DateTime.now() : json['date'],
      products: (json['products'] as List)
          .map((item) => ProductQuantityModel.fromJson(item))
          .toList(),
    );
  }

  /// Convierte el objeto `CartModel` en un mapa JSON.
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'date': date.toIso8601String(),
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}

/// La clase `ProductQuantityModel` extiende la clase `ProductQuantityEntity` del dominio y representa un modelo de cantidad de producto en el contexto del paquete.
class ProductQuantityModel extends ProductQuantityEntity {
  /// Constructor para crear una instancia de `ProductQuantityModel`.
  ///
  /// - [productId]: ID del producto.
  /// - [quantity]: Cantidad del producto.
  ProductQuantityModel({
    required super.productId,
    required super.quantity,
  });

  /// Crea una instancia de `ProductQuantityModel` a partir de un mapa JSON.
  factory ProductQuantityModel.fromJson(Map<String, dynamic> json) {
    return ProductQuantityModel(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  /// Convierte el objeto `ProductQuantityModel` en un mapa JSON.
  @override
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}
