import 'package:dart_fake_store_api_wrapper/src/core/errors/failures.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/repositories/cart_repository.dart';
import 'package:dart_fake_store_api_wrapper/src/infrastructure/models/cart_model.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'cart_repository_test.mocks.dart';

// Generar mocks para ApiClient
@GenerateMocks([CartRepository])
void main() {
  late CartRepository mockRepository;

  setUp(() {
    mockRepository = MockCartRepository();
  });

  group('sendProductToCart', () {
    test('debería devolver un CartModel cuando la llamada sea exitosa',
        () async {
      // Arrange
      final cartModel =
          CartModel(userId: 1, date: DateTime.now(), products: []);
      when(mockRepository.sendProductToCart(cartModel))
          .thenAnswer((_) async => Right(cartModel));

      // Act
      final result = await mockRepository.sendProductToCart(cartModel);

      // Assert
      expect(result, Right(cartModel));
    });

    test('debería lanzar un Failure cuando la llamada falle', () async {
      // Arrange
      final cartModel =
          CartModel(userId: 1, date: DateTime.now(), products: []);
      final failure = ServerFailure('Error inesperado');
      when(mockRepository.sendProductToCart(cartModel))
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await mockRepository.sendProductToCart(cartModel);

      // Assert
      expect(result, Left(failure));
    });
  });
}
