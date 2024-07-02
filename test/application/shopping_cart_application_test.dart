import 'package:dart_fake_store_api_wrapper/dart_fake_store_api_wrapper.dart';
import 'package:dart_fake_store_api_wrapper/src/application/shopping_cart_application.dart';
import 'package:dart_fake_store_api_wrapper/src/core/errors/failures.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/use_cases/products.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/use_cases/users.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'shopping_cart_application_test.mocks.dart';

@GenerateMocks([Products, Users])
void main() {
  late ShoppingCartApplication app;
  late MockProducts mockProducts;
  late MockUsers mockUsers;

  setUp(() {
    mockProducts = MockProducts();
    mockUsers = MockUsers();
    app = ShoppingCartApplication(mockProducts, mockUsers);
  });

  group('ShoppingCartApplication', () {
    group('fetchProducts', () {
      final productList = <ProductEntity>[];

      test(
          'debería retornar Right con lista de ProductEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockProducts.callProducts())
            .thenAnswer((_) async => Right(productList));

        // Act
        final result = await app.fetchProducts();

        // Assert
        expect(result, Right(productList));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockProducts.callProducts())
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await app.fetchProducts();

        // Assert
        expect(result, Left(failure));
      });
    });

    group('fetchSingleProduct', () {
      final productId = 1;
      final product = ProductEntity(
        id: 1,
        title: 'Producto de prueba',
        price: 99.99,
        description: 'Descripción del producto de prueba',
        category: 'Categoría de prueba',
        image: 'https://url_de_imagen.com',
        rating: RatingEntity(rate: 4.5, count: 100),
      );

      test(
          'debería retornar Right con ProductEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockProducts.callSingleProduct(productId))
            .thenAnswer((_) async => Right(product));

        // Act
        final result = await app.fetchSingleProduct(productId);

        // Assert
        expect(result, Right(product));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockProducts.callSingleProduct(productId))
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await app.fetchSingleProduct(productId);

        // Assert
        expect(result, Left(failure));
      });
    });

    group('sendProductToCart', () {
      final cart =
          CartEntity(id: 1, userId: 1, date: DateTime.now(), products: []);

      test('debería retornar Right con CartEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockProducts.callSendProduct(cart))
            .thenAnswer((_) async => Right(cart));

        // Act
        final result = await app.sendProductToCart(cart);

        // Assert
        expect(result, Right(cart));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockProducts.callSendProduct(cart))
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await app.sendProductToCart(cart);

        // Assert
        expect(result, Left(failure));
      });
    });

    group('sendRegister', () {
      final userData = UserEntity(
        email: 'john.doe@example.com',
        username: 'johndoe',
        password: 'password123',
        name: null,
        address: null,
        phone: null,
      );
      final idEntity = IdEntity(id: 1);

      test('debería retornar Right con IdEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockUsers.callRegister(userData))
            .thenAnswer((_) async => Right(idEntity));

        // Act
        final result = await app.sendRegister(userData);

        // Assert
        expect(result, Right(idEntity));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockUsers.callRegister(userData))
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await app.sendRegister(userData);

        // Assert
        expect(result, Left(failure));
      });
    });

    group('sendSignIn', () {
      final userData = UserEntity(
        email: 'john.doe@example.com',
        username: 'johndoe',
        password: 'password123',
        name: null,
        address: null,
        phone: null,
      );
      final tokenEntity = TokenEntity(token: '123456');

      test(
          'debería retornar Right con TokenEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockUsers.callSignIn(userData))
            .thenAnswer((_) async => Right(tokenEntity));

        // Act
        final result = await app.sendSignIn(userData);

        // Assert
        expect(result, Right(tokenEntity));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockUsers.callSignIn(userData))
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await app.sendSignIn(userData);

        // Assert
        expect(result, Left(failure));
      });
    });

    group('fetchInfo', () {
      final idUser = '1';
      final userEntity = UserEntity(
        email: 'john.doe@example.com',
        username: 'johndoe',
        password: 'password123',
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

      test('debería retornar Right con UserEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockUsers.callInfo(idUser))
            .thenAnswer((_) async => Right(userEntity));

        // Act
        final result = await app.fetchInfo(idUser);

        // Assert
        expect(result, Right(userEntity));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockUsers.callInfo(idUser)).thenAnswer((_) async => Left(failure));

        // Act
        final result = await app.fetchInfo(idUser);

        // Assert
        expect(result, Left(failure));
      });
    });

    group('fetchCategories', () {
      final categories = <String>[
        'electronics',
        'jewelery',
        'men\'s clothing',
        'women\'s clothing'
      ];

      test(
          'debería retornar Right con lista de categorías cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockProducts.callGetCategories())
            .thenAnswer((_) async => Right(categories));

        // Act
        final result = await app.fetchCategories();

        // Assert
        expect(result, Right(categories));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockProducts.callGetCategories())
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await app.fetchCategories();

        // Assert
        expect(result, Left(failure));
      });
    });
  });
}
