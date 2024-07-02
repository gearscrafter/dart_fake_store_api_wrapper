import 'package:dart_fake_store_api_wrapper/src/infrastructure/models/cart_model.dart';
import 'package:test/test.dart';

void main() {
  group('CartModel', () {
    final productJson = {
      'productId': 1,
      'quantity': 2,
    };

    final cartJson = {
      'id': 1,
      'userId': 1,
      'date': '2023-01-01T00:00:00Z',
      'products': [productJson],
    };

    final productModel = ProductQuantityModel(
      productId: 1,
      quantity: 2,
    );

    final cartModel = CartModel(
      id: 1,
      userId: 1,
      date: DateTime.parse('2023-01-01T00:00:00Z'),
      products: [productModel],
    );

    group('fromJson', () {
      test('debería crear una instancia válida desde JSON', () {
        // Act
        final result = CartModel.fromJson(cartJson);

        // Assert
        expect(result, isA<CartModel>());
        expect(result.id, null);
        expect(result.userId, 1);
        expect(result.products, isA<List<ProductQuantityModel>>());
        expect(result.products.length, 1);
        expect(result.products[0], isA<ProductQuantityModel>());
        expect(result.products[0].productId, 1);
        expect(result.products[0].quantity, 2);
      });
    });

    group('toJson', () {
      test('debería convertir una instancia a JSON correctamente', () {
        // Act
        final result = cartModel.toJson();

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result['userId'], 1);
        expect(result['date'], '2023-01-01T00:00:00.000Z');
        expect(result['products'], isA<List<dynamic>>());
        expect(result['products'].length, 1);
        expect(result['products'][0], productJson);
      });
    });
  });

  group('ProductQuantityModel', () {
    final productJson = {
      'productId': 1,
      'quantity': 2,
    };

    final productModel = ProductQuantityModel(
      productId: 1,
      quantity: 2,
    );

    group('fromJson', () {
      test('debería crear una instancia válida desde JSON', () {
        // Act
        final result = ProductQuantityModel.fromJson(productJson);

        // Assert
        expect(result, isA<ProductQuantityModel>());
        expect(result.productId, 1);
        expect(result.quantity, 2);
      });
    });

    group('toJson', () {
      test('debería convertir una instancia a JSON correctamente', () {
        // Act
        final result = productModel.toJson();

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result['productId'], 1);
        expect(result['quantity'], 2);
      });
    });
  });
}
