import 'package:test/test.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/entities/cart_entity.dart';

void main() {
  group('CartEntity', () {
    test('debería inicializarse correctamente', () {
      final date = DateTime.now();
      final products = [
        ProductQuantityEntity(productId: 1, quantity: 2),
        ProductQuantityEntity(productId: 2, quantity: 3),
      ];

      final cart = CartEntity(id: 1, userId: 1, date: date, products: products);

      expect(cart.id, 1);
      expect(cart.userId, 1);
      expect(cart.date, date);
      expect(cart.products, products);
    });

    test('debería permitir un id nulo', () {
      // Arrange
      final date = DateTime.now();
      final products = [
        ProductQuantityEntity(productId: 1, quantity: 2),
        ProductQuantityEntity(productId: 2, quantity: 3),
      ];

      final cart = CartEntity(userId: 1, date: date, products: products);

      expect(cart.id, isNull);
      expect(cart.userId, 1);
      expect(cart.date, date);
      expect(cart.products, products);
    });
  });

  group('ProductQuantityEntity', () {
    test('debería inicializarse correctamente', () {
      // Act
      final productQuantity = ProductQuantityEntity(productId: 1, quantity: 2);

      // Assert
      expect(productQuantity.productId, 1);
      expect(productQuantity.quantity, 2);
    });

    test('debería convertir a JSON correctamente', () {
      final productQuantity = ProductQuantityEntity(productId: 1, quantity: 2);
      final expectedJson = {
        'productId': 1,
        'quantity': 2,
      };

      final json = productQuantity.toJson();

      expect(json, expectedJson);
    });
  });
}
