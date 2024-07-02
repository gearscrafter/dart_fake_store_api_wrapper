import 'package:dart_fake_store_api_wrapper/src/core/errors/failures.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/repositories/product_repository.dart';
import 'package:dart_fake_store_api_wrapper/src/infrastructure/models/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../../infrastructure/models/products.dart';
import 'product_repository_test.mocks.dart';

@GenerateMocks([ProductsRepository])
void main() {
  late ProductsRepository repository;

  setUp(() {
    repository = MockProductsRepository();
  });

  group('ProductsRepository', () {
    group('getProducts', () {
      test(
          'Debería devolver una lista de ProductModel cuando la llamada sea exitosa.',
          () async {
        // Arrange
        final products =
            productListJson.map((json) => ProductModel.fromJson(json)).toList();

        when(repository.getProducts()).thenAnswer((_) async => Right(products));

        // Act
        final result = await repository.getProducts();

        // Assert
        expect(result, equals(Right(products)));
      });

      test('Debería devolver un Failure cuando la llamada falla.', () async {
        // Arrange
        final failure = GeneralFailure('Error all obtener los productos');
        when(repository.getProducts()).thenAnswer((_) async => Left(failure));

        // Act
        final result = await repository.getProducts();

        // Assert
        expect(result, equals(Left(failure)));
      });
    });

    group('getSingleProduct', () {
      test('Debería devolver un ProductModel cuando la llamada sea exitosa.',
          () async {
        // Arrange
        final productId = 1;
        final product = ProductModel.fromJson(productJson); // Mock your product
        when(repository.getSingleProduct(productId))
            .thenAnswer((_) async => Right(product));

        // Act
        final result = await repository.getSingleProduct(productId);

        // Assert
        expect(result, equals(Right(product)));
      });

      test('Debería devolver un Failure cuando la llamada falla.', () async {
        // Arrange
        final productId = 1;
        final failure = GeneralFailure('Error all obtener al producto');
        when(repository.getSingleProduct(productId))
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await repository.getSingleProduct(productId);

        // Assert
        expect(result, equals(Left(failure)));
      });
    });
  });

  group('getCategories', () {
    test(
        'devuelve una lista de categorías si la llamada al remoteDataSource es exitosa',
        () async {
      // Arrange
      when(repository.getCategories())
          .thenAnswer((_) async => Right(categoryList));

      // Act
      final result = await repository.getCategories();

      // Assert
      expect(result, equals(Right(categoryList)));
    });

    test('devuelve GeneralFailure cuando ocurre un error inesperado', () async {
      final failure = GeneralFailure('Error all obtener las categorias');
      // Arrange
      when(repository.getCategories()).thenAnswer((_) async => Left(failure));

      // Act
      final result = await repository.getCategories();

      // Assert
      expect(result, equals(Left(failure)));
    });
  });
}
