// Mocks generated by Mockito 5.4.4 from annotations
// in dart_fake_store_api_wrapper/test/domain/use_cases/products_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dart_fake_store_api_wrapper/dart_fake_store_api_wrapper.dart'
    as _i8;
import 'package:dart_fake_store_api_wrapper/src/core/errors/failures.dart'
    as _i5;
import 'package:dart_fake_store_api_wrapper/src/domain/entities/product_entity.dart'
    as _i6;
import 'package:dart_fake_store_api_wrapper/src/domain/repositories/cart_repository.dart'
    as _i7;
import 'package:dart_fake_store_api_wrapper/src/domain/repositories/product_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductsRepository extends _i1.Mock
    implements _i3.ProductsRepository {
  MockProductsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.ProductEntity>>> getProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.ProductEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.ProductEntity>>(
          this,
          Invocation.method(
            #getProducts,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.ProductEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.ProductEntity>> getSingleProduct(
          int? productId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSingleProduct,
          [productId],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.ProductEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.ProductEntity>(
          this,
          Invocation.method(
            #getSingleProduct,
            [productId],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.ProductEntity>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<String>>> getCategories() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCategories,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<String>>>.value(
            _FakeEither_0<_i5.Failure, List<String>>(
          this,
          Invocation.method(
            #getCategories,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<String>>>);
}

/// A class which mocks [CartRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCartRepository extends _i1.Mock implements _i7.CartRepository {
  MockCartRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i8.CartEntity>> sendProductToCart(
          _i8.CartEntity? cart) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendProductToCart,
          [cart],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i8.CartEntity>>.value(
            _FakeEither_0<_i5.Failure, _i8.CartEntity>(
          this,
          Invocation.method(
            #sendProductToCart,
            [cart],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i8.CartEntity>>);
}