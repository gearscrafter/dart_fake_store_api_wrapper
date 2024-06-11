// La clase `CartModel` extiende la clase `CartEntity` del dominio y representa un modelo de carrito en el contexto del paquete.

import '../../domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    int? id,
    required super.userId,
    required super.date,
    required List<ProductQuantityModel> super.products,
  });

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
  ProductQuantityModel({
    required super.productId,
    required super.quantity,
  });

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
