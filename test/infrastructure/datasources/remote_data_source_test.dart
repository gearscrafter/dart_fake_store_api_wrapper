import 'package:dart_fake_store_api_wrapper/src/core/errors/exceptions.dart';
import 'package:dart_fake_store_api_wrapper/src/core/network/api_client.dart';
import 'package:dart_fake_store_api_wrapper/src/infrastructure/datasources/remote_data_source.dart';
import 'package:dart_fake_store_api_wrapper/src/infrastructure/models/cart_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../models/products.dart';
import '../models/cart.dart';

import 'remote_data_source_test.mocks.dart';

// Generar mocks para ApiClient
@GenerateMocks([ApiClient])
void main() {
  group('RemoteDataSource', () {
    late MockApiClient mockApiClient;
    late RemoteDataSource dataSource;

    setUp(() {
      mockApiClient = MockApiClient();
      dataSource = RemoteDataSourceImpl(mockApiClient);
    });

    group('getProducts', () {
      test(
          'debería devolver una lista de ProductModel cuando la llamada sea exitosa',
          () async {
        // Arrange
        when(mockApiClient.get('products'))
            .thenAnswer((_) async => productListJson);

        // Act
        final result = await dataSource.getProducts();

        // Assert
        expect(result.length, productListJson.length);
        expect(result[0].id, equals(productListJson[0]['id']));
        expect(result[0].title, equals(productListJson[0]['title']));
      });

      test('should throw a GeneralException when the call fails', () async {
        // Assert
        when(mockApiClient.get('products'))
            .thenThrow(Exception('Fallo al cargar los productos'));

        // Act
        expect(
            () => dataSource.getProducts(), throwsA(isA<GeneralException>()));
      });
    });

    group('getSingleProduct', () {
      test('debería devolver un ProductModel cuando la llamada sea exitosa',
          () async {
        // Arrange
        when(mockApiClient.get('products/1'))
            .thenAnswer((_) async => productJson);

        // Act
        final result = await dataSource.getSingleProduct(1);

        // Assert
        expect(result.id, equals(productJson['id']));
        expect(result.title, equals(productJson['title']));
      });

      test('debería lanzar una GeneralException cuando la llamada falla',
          () async {
        // Arrange
        when(mockApiClient.get('products/1'))
            .thenThrow(Exception('Fallo al cargar el producto'));

        // Act & Assert
        expect(() => dataSource.getSingleProduct(1),
            throwsA(isA<GeneralException>()));
      });
    });

    group('sendProductToCart', () {
      test('debería devolver un CartModel cuando la llamada sea exitosa',
          () async {
        // Arrange
        when(mockApiClient.post('carts/', any))
            .thenAnswer((_) async => cartJson);

        // Act
        final cartData = CartModel.fromJson(cartJson);
        final result = await dataSource.sendProductToCart(cartData);

        // Assert
        expect(result.userId, equals(cartJson['userId']));
      });

      test('debería lanzar una GeneralException cuando la llamada falla',
          () async {
        // Arrange
        when(mockApiClient.post('carts/', any)).thenThrow(
            Exception('Fallo cuando se envio un producto al carrito'));

        // Act
        final cartData =
            CartModel(id: 1, userId: 1, date: DateTime.now(), products: []);
        // Assert
        expect(() => dataSource.sendProductToCart(cartData),
            throwsA(isA<GeneralException>()));
      });
    });
  });
}
