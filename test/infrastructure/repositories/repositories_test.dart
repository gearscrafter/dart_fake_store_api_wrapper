import 'package:dart_fake_store_api_wrapper/src/domain/entities/user_entity.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'package:dart_fake_store_api_wrapper/src/core/errors/exceptions.dart';
import 'package:dart_fake_store_api_wrapper/src/core/errors/failures.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/entities/cart_entity.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/entities/product_entity.dart';
import 'package:dart_fake_store_api_wrapper/src/infrastructure/datasources/remote_data_source.dart';
import 'package:dart_fake_store_api_wrapper/src/infrastructure/repositories/repositories.dart';

import 'repositories_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
void main() {
  late Repositories repositories;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repositories = Repositories(mockRemoteDataSource);
  });

  group('Repositories', () {
    group('sendProductToCart', () {
      final cart =
          CartEntity(id: 1, userId: 1, date: DateTime.now(), products: []);

      test('debería retornar Right con CartEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockRemoteDataSource.sendProductToCart(cart))
            .thenAnswer((_) async => cart);

        // Act
        final result = await repositories.sendProductToCart(cart);

        // Assert
        expect(result, Right(cart));
      });

      test('debería retornar ServerFailure cuando ocurre un ServerException',
          () async {
        // Arrange
        when(mockRemoteDataSource.sendProductToCart(cart))
            .thenThrow(ServerException());

        // Act
        try {
          await repositories.sendProductToCart(cart);
        } catch (e) {
          expect(e, Left(isA<ServerFailure>()));
        }

        // Assert
      });

      test('debería retornar CacheFailure cuando ocurre un CacheException',
          () async {
        // Arrange
        when(mockRemoteDataSource.sendProductToCart(cart))
            .thenThrow(CacheException());

        // Assert
        try {
          await repositories.sendProductToCart(cart);
        } catch (e) {
          expect(e, Left(CacheFailure('Error de caché')));
        }
      });

      test(
          'debería retornar GeneralFailure cuando ocurre una excepción inesperada',
          () async {
        // Arrange
        when(mockRemoteDataSource.sendProductToCart(cart))
            .thenThrow(Exception('Unexpected error'));

        try {
          // Act
          await repositories.sendProductToCart(cart);
        } catch (e) {
          expect(
              e,
              Left(GeneralFailure(
                  'Error inesperado: Exception: Unexpected error')));
        }
        // Assert
      });
    });

    group('getProducts', () {
      final products = <ProductEntity>[];

      test(
          'debería retornar Right con lista de ProductEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockRemoteDataSource.getProducts())
            .thenAnswer((_) async => products);

        // Act
        final result = await repositories.getProducts();

        // Assert
        expect(result, Right(products));
      });

      test('debería retornar ServerFailure cuando ocurre un ServerException',
          () async {
        // Arrange
        when(mockRemoteDataSource.getProducts()).thenThrow(ServerException());

        // Act
        try {
          await repositories.getProducts();
        } catch (e) {
          // Assert
          expect(e, Left(ServerFailure('Error en el servidor')));
        }
      });

      test('debería retornar CacheFailure cuando ocurre un CacheException',
          () async {
        // Arrange
        when(mockRemoteDataSource.getProducts()).thenThrow(CacheException());

        // Act
        try {
          await repositories.getProducts();
        } catch (e) {
          // Assert
          expect(e, Left(CacheFailure('Error de caché')));
        }
      });

      test(
          'debería retornar GeneralFailure cuando ocurre una excepción inesperada',
          () async {
        // Arrange
        when(mockRemoteDataSource.getProducts())
            .thenThrow(Exception('Unexpected error'));

        // Act
        try {
          await repositories.getProducts();
        } catch (e) {
          // Assert
          expect(
              e,
              Left(GeneralFailure(
                  'Error inesperado: Exception: Unexpected error')));
        }
      });
    });

    group('getInfo', () {
      final idUser = '1';
      final user = UserEntity(
          username: 'User 1', email: 'user1@example.com', password: '');

      test('debería retornar Right con UserEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockRemoteDataSource.getInfoUser(idUser))
            .thenAnswer((_) async => user);

        // Act
        final result = await repositories.getInfo(idUser);

        // Assert
        expect(result, Right(user));
      });

      test('debería retornar ServerFailure cuando ocurre un ServerException',
          () async {
        // Arrange
        when(mockRemoteDataSource.getInfoUser(idUser))
            .thenThrow(ServerException());

        // Act
        try {
          await repositories.getInfo(idUser);
        } catch (e) {
          // Assert
          expect(
              e,
              Left(isA<ServerFailure>().having(
                  (f) => f.message, 'message', 'Error en el servidor')));
        }
      });

      test('debería retornar CacheFailure cuando ocurre un CacheException',
          () async {
        // Arrange
        when(mockRemoteDataSource.getInfoUser(idUser))
            .thenThrow(CacheException());

        // Act
        try {
          await repositories.getInfo(idUser);
        } catch (e) {
          // Assert
          expect(
              e,
              Left(isA<CacheFailure>()
                  .having((f) => f.message, 'message', 'Error de caché')));
        }
      });

      test(
          'debería retornar GeneralFailure cuando ocurre una excepción inesperada',
          () async {
        // Arrange
        when(mockRemoteDataSource.getInfoUser(idUser))
            .thenThrow(Exception('Unexpected error'));

        // Act
        try {
          await repositories.getInfo(idUser);
        } catch (e) {
          // Assert
          expect(
              e,
              Left(isA<GeneralFailure>().having((f) => f.message, 'message',
                  'Error inesperado: Exception: Unexpected error')));
        }
      });
    });

    group('register', () {
      final id = IdEntity(id: 1);
      final user = UserEntity(
          username: 'User 1', email: 'user1@example.com', password: '');

      test('debería retornar Right con UserEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockRemoteDataSource.registerUser(user))
            .thenAnswer((_) async => id);

        // Act
        final result = await repositories.register(user);

        // Assert
        expect(result, Right(id));
      });

      test('debería retornar ServerFailure cuando ocurre un ServerException',
          () async {
        // Arrange
        when(mockRemoteDataSource.registerUser(user))
            .thenThrow(ServerException());

        // Act
        try {
          await repositories.register(user);
        } catch (e) {
          // Assert
          expect(
              e,
              Left(isA<ServerFailure>().having(
                  (f) => f.message, 'message', 'Error en el servidor')));
        }
      });

      test('debería retornar CacheFailure cuando ocurre un CacheException',
          () async {
        // Arrange
        when(mockRemoteDataSource.registerUser(user))
            .thenThrow(CacheException());

        // Act
        try {
          await repositories.register(user);
        } catch (e) {
          // Assert
          expect(
              e,
              Left(isA<CacheFailure>()
                  .having((f) => f.message, 'message', 'Error de caché')));
        }
      });

      test(
          'debería retornar GeneralFailure cuando ocurre una excepción inesperada',
          () async {
        // Arrange
        when(mockRemoteDataSource.registerUser(user))
            .thenThrow(Exception('Unexpected error'));

        // Act
        try {
          await repositories.register(user);
        } catch (e) {
          // Assert
          expect(
              e,
              Left(isA<GeneralFailure>().having((f) => f.message, 'message',
                  'Error inesperado: Exception: Unexpected error')));
        }
      });
    });

    group('signIn', () {
      final token = TokenEntity(token: '_');
      final user = UserEntity(
          username: 'User 1', email: 'user1@example.com', password: '');

      test('debería retornar Right con UserEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockRemoteDataSource.signInUser(user))
            .thenAnswer((_) async => token);

        // Act
        final result = await repositories.signIn(user);

        // Assert
        expect(result, Right(token));
      });

      test('debería retornar ServerFailure cuando ocurre un ServerException',
          () async {
        // Arrange
        when(mockRemoteDataSource.signInUser(user))
            .thenThrow(ServerException());

        // Act
        try {
          await repositories.signIn(user);
        } catch (e) {
          // Assert
          expect(
              e,
              Left(isA<ServerFailure>().having(
                  (f) => f.message, 'message', 'Error en el servidor')));
        }
      });

      test('debería retornar CacheFailure cuando ocurre un CacheException',
          () async {
        // Arrange
        when(mockRemoteDataSource.signInUser(user)).thenThrow(CacheException());

        // Act
        try {
          await repositories.signIn(user);
        } catch (e) {
          // Assert
          expect(
              e,
              Left(isA<CacheFailure>()
                  .having((f) => f.message, 'message', 'Error de caché')));
        }
      });

      test(
          'debería retornar GeneralFailure cuando ocurre una excepción inesperada',
          () async {
        // Arrange
        when(mockRemoteDataSource.signInUser(user))
            .thenThrow(Exception('Unexpected error'));

        // Act
        try {
          await repositories.signIn(user);
        } catch (e) {
          // Assert
          expect(
              e,
              Left(isA<GeneralFailure>().having((f) => f.message, 'message',
                  'Error inesperado: Exception: Unexpected error')));
        }
      });
    });

    group('getCategories', () {
      final categories = <String>[
        'electronics',
        'jewelery',
        'men\'s clothing',
        'women\'s clothing'
      ];

      test('debería retornar Right con UserEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockRemoteDataSource.getCategories())
            .thenAnswer((_) async => categories);

        // Act
        final result = await repositories.getCategories();

        // Assert
        expect(result, Right(categories));
      });

      test('debería retornar ServerFailure cuando ocurre un ServerException',
          () async {
        // Arrange
        when(mockRemoteDataSource.getCategories()).thenThrow(ServerException());

        // Act
        try {
          await repositories.getCategories();
        } catch (e) {
          // Assert
          expect(
              e,
              Left(isA<ServerFailure>().having(
                  (f) => f.message, 'message', 'Error en el servidor')));
        }
      });

      test('debería retornar CacheFailure cuando ocurre un CacheException',
          () async {
        // Arrange
        when(mockRemoteDataSource.getCategories()).thenThrow(ServerException());

        // Act
        try {
          await repositories.getCategories();
        } catch (e) {
          // Assert
          expect(
              e,
              Left(isA<CacheFailure>()
                  .having((f) => f.message, 'message', 'Error de caché')));
        }
      });

      test(
          'debería retornar GeneralFailure cuando ocurre una excepción inesperada',
          () async {
        // Arrange
        when(mockRemoteDataSource.getCategories()).thenThrow(ServerException());

        // Act
        try {
          await repositories.getCategories();
        } catch (e) {
          // Assert
          expect(
              e,
              Left(isA<GeneralFailure>().having((f) => f.message, 'message',
                  'Error inesperado: Exception: Unexpected error')));
        }
      });
    });
  });
}
