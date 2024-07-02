import 'package:dart_fake_store_api_wrapper/src/infrastructure/models/product_model.dart';
import 'package:test/test.dart';

void main() {
  group('ProductModel', () {
    final ratingJson = {
      'rate': 4.5,
      'count': 100,
    };

    final productJson = {
      'id': 1,
      'title': 'Product Title',
      'price': 99.99,
      'description': 'Product Description',
      'category': 'Category',
      'image': 'https://image.url',
      'rating': ratingJson,
    };

    final ratingModel = RatingModel(
      rate: 4.5,
      count: 100,
    );

    final productModel = ProductModel(
      id: 1,
      title: 'Product Title',
      price: 99.99,
      description: 'Product Description',
      category: 'Category',
      image: 'https://image.url',
      rating: ratingModel,
    );

    group('fromJson', () {
      test('debería crear una instancia válida desde JSON', () {
        // Act
        final result = ProductModel.fromJson(productJson);

        // Assert
        expect(result, isA<ProductModel>());
        expect(result.id, 1);
        expect(result.title, 'Product Title');
        expect(result.price, 99.99);
        expect(result.description, 'Product Description');
        expect(result.category, 'Category');
        expect(result.image, 'https://image.url');
        expect(result.rating, isA<RatingModel>());
        expect(result.rating.rate, 4.5);
        expect(result.rating.count, 100);
      });
    });

    group('toJson', () {
      test('debería convertir una instancia a JSON correctamente', () {
        // Act
        final result = productModel.toJson();

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result['id'], 1);
        expect(result['title'], 'Product Title');
        expect(result['price'], 99.99);
        expect(result['description'], 'Product Description');
        expect(result['category'], 'Category');
        expect(result['image'], 'https://image.url');
        expect(result['rating'], ratingJson);
      });
    });
  });

  group('RatingModel', () {
    final ratingJson = {
      'rate': 4.5,
      'count': 100,
    };

    final ratingModel = RatingModel(
      rate: 4.5,
      count: 100,
    );

    group('fromJson', () {
      test('debería crear una instancia válida desde JSON', () {
        // Act
        final result = RatingModel.fromJson(ratingJson);

        // Assert
        expect(result, isA<RatingModel>());
        expect(result.rate, 4.5);
        expect(result.count, 100);
      });
    });

    group('toJson', () {
      test('debería convertir una instancia a JSON correctamente', () {
        // Act
        final result = ratingModel.toJson();

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result['rate'], 4.5);
        expect(result['count'], 100);
      });
    });
  });
}
