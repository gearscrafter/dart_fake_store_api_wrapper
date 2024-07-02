import 'package:dart_fake_store_api_wrapper/src/core/errors/exceptions.dart';
import 'package:dart_fake_store_api_wrapper/src/core/network/api_client.dart';
import 'package:dart_fake_store_api_wrapper/src/infrastructure/datasources/remote_data_source.dart';
import 'package:dart_fake_store_api_wrapper/src/infrastructure/models/cart_model.dart';
import 'package:dart_fake_store_api_wrapper/src/infrastructure/models/user_model.dart';
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

      test('debería lanzar una GeneralException cuando la llamada falla',
          () async {
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

    group('getCategories', () {
      test(
          'debería devolver una lista de categorías si la llamada al API es exitosa',
          () async {
        // Arrange
        when(mockApiClient.get('products/categories'))
            .thenAnswer((_) async => categoryList);

        // Act
        final categories = await dataSource.getCategories();

        // Assert
        expect(categories, equals(categoryList));
      });

      test('debería lanzar una GeneralException cuando la llamada falla',
          () async {
        // Assert
        when(mockApiClient.get('products/categories'))
            .thenThrow(Exception('Fallo al cargar las categorias'));

        // Act
        expect(
            () => dataSource.getCategories(), throwsA(isA<GeneralException>()));
      });
    });

    group('getInfoUser', () {
      test('debería lanzar una GeneralException cuando la llamada falla',
          () async {
        // Arrange
        when(mockApiClient.get('users/1'))
            .thenThrow(Exception('Fallo al cargar la información del usuario'));

        // Act & Assert
        expect(() => dataSource.getInfoUser('1'),
            throwsA(isA<GeneralException>()));
      });
    });

    group('registerUser', () {
      test('debería lanzar una GeneralException cuando la llamada falla',
          () async {
        // Arrange
        when(mockApiClient.post('auth/login', any))
            .thenThrow(Exception('Fallo al registrar el usuario'));

        // Act
        final userData =
            UserModel(username: 'johndoe', password: 'password123');
        // Assert
        expect(() => dataSource.registerUser(userData),
            throwsA(isA<GeneralException>()));
      });
    });

    group('signInUser', () {
      test('debería lanzar una GeneralException cuando la llamada falla',
          () async {
        // Arrange
        when(mockApiClient.post('users', any))
            .thenThrow(Exception('Fallo al iniciar sesión del usuario'));

        // Act
        final userData = UserModel(
            username: 'johndoe',
            password: 'password123',
            email: 'john.doe@example.com',
            name: null,
            address: null,
            phone: '1234567890');
        // Assert
        expect(() => dataSource.signInUser(userData),
            throwsA(isA<GeneralException>()));
      });
    });
  });
}
