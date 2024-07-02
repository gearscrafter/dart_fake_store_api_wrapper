import 'package:dart_fake_store_api_wrapper/src/core/errors/failures.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/entities/cart_entity.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/entities/product_entity.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/repositories/cart_repository.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/repositories/product_repository.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/use_cases/products.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../container_test.mocks.dart';

@GenerateMocks([ProductsRepository, CartRepository])
void main() {
  late Products products;
  late MockProductsRepository mockProductsRepository;
  late MockCartRepository mockCartRepository;

  setUp(() {
    mockProductsRepository = MockProductsRepository();
    mockCartRepository = MockCartRepository();
    products = Products(mockProductsRepository, mockCartRepository);
  });

  group('Products', () {
    group('callProducts', () {
      final productList = <ProductEntity>[];

      test(
          'debería retornar Right con lista de ProductEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockProductsRepository.getProducts())
            .thenAnswer((_) async => Right(productList));

        // Act
        final result = await products.callProducts();

        // Assert
        expect(result, Right(productList));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockProductsRepository.getProducts())
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await products.callProducts();

        // Assert
        expect(result, Left(failure));
      });
    });

    group('callSingleProduct', () {
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
        when(mockProductsRepository.getSingleProduct(productId))
            .thenAnswer((_) async => Right(product));

        // Act
        final result = await products.callSingleProduct(productId);

        // Assert
        expect(result, Right(product));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockProductsRepository.getSingleProduct(productId))
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await products.callSingleProduct(productId);

        // Assert
        expect(result, Left(failure));
      });
    });

    group('callSendProduct', () {
      final cart =
          CartEntity(id: 1, userId: 1, date: DateTime.now(), products: []);

      test('debería retornar Right con CartEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockCartRepository.sendProductToCart(cart))
            .thenAnswer((_) async => Right(cart));

        // Act
        final result = await products.callSendProduct(cart);

        // Assert
        expect(result, Right(cart));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockCartRepository.sendProductToCart(cart))
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await products.callSendProduct(cart);

        // Assert
        expect(result, Left(failure));
      });
    });

    group('callGetCategories', () {
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
        when(mockProductsRepository.getCategories())
            .thenAnswer((_) async => Right(categories));

        // Act
        final result = await products.callGetCategories();

        // Assert
        expect(result, Right(categories));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockProductsRepository.getCategories())
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await products.callGetCategories();

        // Assert
        expect(result, Left(failure));
      });
    });
  });
}
