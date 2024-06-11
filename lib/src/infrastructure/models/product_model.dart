// La clase `ProductModel` extiende la clase `ProductEntity` del dominio y representa un modelo de un producto en el contexto del paquete.
import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.category,
      required super.image,
      required RatingModel rating})
      : super(rating: rating);
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

class RatingModel extends RatingEntity {
  RatingModel({required super.rate, required super.count});
  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
        rate: (json['rate'] is int) ? json['rate'].toDouble() : json['rate'],
        count: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {'rate': rate, 'count': count};
  }
}
