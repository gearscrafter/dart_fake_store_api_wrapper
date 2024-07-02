import 'package:dart_fake_store_api_wrapper/src/domain/entities/product_entity.dart';
import 'package:test/test.dart';

void main() {
  group('RatingEntity', () {
    test('debería inicializarse correctamente', () {
      // Act
      final rating = RatingEntity(rate: 4.5, count: 100);

      // Assert
      expect(rating.rate, 4.5);
      expect(rating.count, 100);
    });
  });

  group('ProductEntity', () {
    test('debería inicializarse correctamente', () {
      // Arrange
      final rating = RatingEntity(rate: 4.5, count: 100);

      // Act
      final product = ProductEntity(
        id: 1,
        title: 'Producto de prueba',
        price: 99.99,
        description: 'Descripción del producto de prueba',
        category: 'Categoría de prueba',
        image: 'https://url_de_imagen.com',
        rating: rating,
      );

      // Assert
      expect(product.id, 1);
      expect(product.title, 'Producto de prueba');
      expect(product.price, 99.99);
      expect(product.description, 'Descripción del producto de prueba');
      expect(product.category, 'Categoría de prueba');
      expect(product.image, 'https://url_de_imagen.com');
      expect(product.rating, rating);
    });
  });
}
