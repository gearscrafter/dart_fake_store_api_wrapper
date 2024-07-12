// La clase `ProductModel` extiende la clase `ProductEntity` del dominio y representa un modelo de un producto en el contexto del paquete.
import '../../domain/entities/product_entity.dart';

/// La clase `ProductModel` representa un modelo de producto.
class ProductModel extends ProductEntity {
  /// Constructor para crear una instancia de `ProductModel`.
  ///
  /// - [id]: ID del producto.
  /// - [title]: Título del producto.
  /// - [price]: Precio del producto.
  /// - [description]: Descripción del producto.
  /// - [category]: Categoría del producto.
  /// - [image]: URL de la imagen del producto.
  /// - [rating]: Calificación del producto representada por una instancia de `RatingModel`.
  ProductModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.category,
      required super.image,
      required RatingModel rating})
      : super(rating: rating);

  /// Crea una instancia de `ProductModel` a partir de un mapa JSON.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price:
            (json['price'] is int) ? json['price'].toDouble() : json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: RatingModel.fromJson(json['rating']));
  }

  /// Convierte el objeto `ProductModel` en un mapa JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': (rating as RatingModel).toJson()
    };
  }
}

/// La clase `RatingModel` extiende la clase `RatingEntity` del dominio y representa un modelo de calificación en el contexto del paquete.
class RatingModel extends RatingEntity {
  /// Constructor para crear una instancia de `RatingModel`.
  ///
  /// - [rate]: Puntuación del producto.
  /// - [count]: Cantidad de evaluaciones del producto.
  RatingModel({required super.rate, required super.count});

  /// Crea una instancia de `RatingModel` a partir de un mapa JSON.
  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
        rate: (json['rate'] is int) ? json['rate'].toDouble() : json['rate'],
        count: json['count']);
  }

  /// Convierte el objeto `RatingModel` en un mapa JSON.
  Map<String, dynamic> toJson() {
    return {'rate': rate, 'count': count};
  }
}
