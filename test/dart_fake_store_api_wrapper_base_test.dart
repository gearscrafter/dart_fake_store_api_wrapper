import 'package:dart_fake_store_api_wrapper/dart_fake_store_api_wrapper.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'package:dart_fake_store_api_wrapper/src/core/errors/failures.dart';
import 'package:dart_fake_store_api_wrapper/src/application/shopping_cart_application.dart';

import 'dart_fake_store_api_wrapper_base_test.mocks.dart';

@GenerateMocks([ShoppingCartApplication])
void main() {
  late MockShoppingCartApplication mockShoppingCartApplication;
  late DartFakeStoreApiWrapper apiWrapper;

  setUp(() {
    mockShoppingCartApplication = MockShoppingCartApplication();
    apiWrapper = DartFakeStoreApiWrapper(mockShoppingCartApplication);
  });

  group('DartFakeStoreApiWrapper', () {
    group('runFetchProducts', () {
      final products = [
        ProductEntity(
          id: 1,
          title: 'Product 1',
          price: 10.0,
          description: 'Description 1',
          category: 'Category 1',
          image: 'image1.png',
          rating: RatingEntity(rate: 4.5, count: 10),
        )
      ];

      test(
          'debería devolver una lista de ProductEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockShoppingCartApplication.fetchProducts())
            .thenAnswer((_) async => Right(products));

        // Act
        final result = await apiWrapper.runFetchProducts();

        // Assert
        expect(result, products);
        verify(mockShoppingCartApplication.fetchProducts()).called(1);
      });

      test('debería lanzar una excepción cuando la llamada falla', () async {
        // Arrange
        when(mockShoppingCartApplication.fetchProducts())
            .thenAnswer((_) async => Left(GeneralFailure('Error')));

        // Act & Assert
        expect(() => apiWrapper.runFetchProducts(), throwsException);
      });
    });

    group('runFetchSingleProduct', () {
      final product = ProductEntity(
        id: 1,
        title: 'Product 1',
        price: 10.0,
        description: 'Description 1',
        category: 'Category 1',
        image: 'image1.png',
        rating: RatingEntity(rate: 4.5, count: 10),
      );

      test('debería devolver un ProductEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockShoppingCartApplication.fetchSingleProduct(1))
            .thenAnswer((_) async => Right(product));

        // Act
        final result = await apiWrapper.runFetchSingleProduct(1);

        // Assert
        expect(result, product);
        verify(mockShoppingCartApplication.fetchSingleProduct(1)).called(1);
      });

      test('debería lanzar una excepción cuando la llamada falla', () async {
        // Arrange
        when(mockShoppingCartApplication.fetchSingleProduct(1))
            .thenAnswer((_) async => Left(GeneralFailure('Error')));

        // Act & Assert
        expect(() => apiWrapper.runFetchSingleProduct(1), throwsException);
      });
    });

    group('runSendProductToCart', () {
      final cart =
          CartEntity(id: 1, userId: 1, date: DateTime.now(), products: []);

      test('debería devolver un CartEntity cuando la llamada es exitosa',
          () async {
        when(mockShoppingCartApplication.sendProductToCart(cart))
            .thenAnswer((_) async => Right(cart));

        final result = await apiWrapper.runSendProductToCart(cart);

        expect(result, cart);
        verify(mockShoppingCartApplication.sendProductToCart(cart)).called(1);
      });

      test('debería lanzar una excepción cuando la llamada falla', () async {
        when(mockShoppingCartApplication.sendProductToCart(cart))
            .thenAnswer((_) async => Left(GeneralFailure('Error')));

        expect(() => apiWrapper.runSendProductToCart(cart), throwsException);
      });
    });

    group('runSendRegister', () {
      final user = UserEntity(username: 'username', password: 'password');
      final idEntity = IdEntity(id: 1);

      test('debería devolver un IdEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockShoppingCartApplication.sendRegister(user))
            .thenAnswer((_) async => Right(idEntity));

        final result = await apiWrapper.runSendRegister(user);

        expect(result, idEntity);
        verify(mockShoppingCartApplication.sendRegister(user)).called(1);
      });

      test('debería lanzar una excepción cuando la llamada falla', () async {
        when(mockShoppingCartApplication.sendRegister(user))
            .thenAnswer((_) async => Left(GeneralFailure('Error')));

        expect(() => apiWrapper.runSendRegister(user), throwsException);
      });
    });

    group('runSendSignIn', () {
      final user = UserEntity(username: 'username', password: 'password');
      final tokenEntity = TokenEntity(token: 'token');

      test('debería devolver un TokenEntity cuando la llamada es exitosa',
          () async {
        when(mockShoppingCartApplication.sendSignIn(user))
            .thenAnswer((_) async => Right(tokenEntity));

        final result = await apiWrapper.runSendSignIn(user);

        expect(result, tokenEntity);
        verify(mockShoppingCartApplication.sendSignIn(user)).called(1);
      });

      test('debería lanzar una excepción cuando la llamada falla', () async {
        when(mockShoppingCartApplication.sendSignIn(user))
            .thenAnswer((_) async => Left(GeneralFailure('Error')));

        expect(() => apiWrapper.runSendSignIn(user), throwsException);
      });
    });

    group('runFetchInfo', () {
      final user = UserEntity(
        username: 'username',
        password: 'password',
        email: 'email@example.com',
        name: NameEntity(firstname: 'John', lastname: 'Doe'),
        address: AddressEntity(
          city: 'City',
          street: 'Street',
          number: 123,
          zipcode: '12345',
          geolocation: GeolocationEntity(lat: '123.456', long: '789.012'),
        ),
        phone: '1234567890',
      );

      test('debería devolver un UserEntity cuando la llamada es exitosa',
          () async {
        when(mockShoppingCartApplication.fetchInfo('1'))
            .thenAnswer((_) async => Right(user));

        final result = await apiWrapper.runFetchInfo('1');

        expect(result, user);
        verify(mockShoppingCartApplication.fetchInfo('1')).called(1);
      });

      test('debería lanzar una excepción cuando la llamada falla', () async {
        when(mockShoppingCartApplication.fetchInfo('1'))
            .thenAnswer((_) async => Left(GeneralFailure('Error')));

        expect(() => apiWrapper.runFetchInfo('1'), throwsException);
      });
    });

    group('runFetchCategories', () {
      final categories = ['Category 1', 'Category 2'];

      test(
          'debería devolver una lista de categorías cuando la llamada es exitosa',
          () async {
        when(mockShoppingCartApplication.fetchCategories())
            .thenAnswer((_) async => Right(categories));

        final result = await apiWrapper.runFetchCategories();
        expect(result, categories);
        verify(mockShoppingCartApplication.fetchCategories()).called(1);
      });

      test('debería lanzar una excepción cuando la llamada falla', () async {
        when(mockShoppingCartApplication.fetchCategories())
            .thenAnswer((_) async => Left(GeneralFailure('Error')));

        expect(() => apiWrapper.runFetchCategories(), throwsException);
      });
    });
  });
}
