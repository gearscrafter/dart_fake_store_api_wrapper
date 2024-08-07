// Mocks generated by Mockito 5.4.4 from annotations
// in dart_fake_store_api_wrapper/test/dart_fake_store_api_wrapper_base_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dart_fake_store_api_wrapper/src/application/shopping_cart_application.dart'
    as _i5;
import 'package:dart_fake_store_api_wrapper/src/core/errors/failures.dart'
    as _i7;
import 'package:dart_fake_store_api_wrapper/src/domain/entities/cart_entity.dart'
    as _i9;
import 'package:dart_fake_store_api_wrapper/src/domain/entities/product_entity.dart'
    as _i8;
import 'package:dart_fake_store_api_wrapper/src/domain/entities/user_entity.dart'
    as _i10;
import 'package:dart_fake_store_api_wrapper/src/domain/use_cases/products.dart'
    as _i2;
import 'package:dart_fake_store_api_wrapper/src/domain/use_cases/users.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i4;
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

class _FakeProducts_0 extends _i1.SmartFake implements _i2.Products {
  _FakeProducts_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUsers_1 extends _i1.SmartFake implements _i3.Users {
  _FakeUsers_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_2<L, R> extends _i1.SmartFake implements _i4.Either<L, R> {
  _FakeEither_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ShoppingCartApplication].
///
/// See the documentation for Mockito's code generation for more information.
class MockShoppingCartApplication extends _i1.Mock
    implements _i5.ShoppingCartApplication {
  MockShoppingCartApplication() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Products get productUseCase => (super.noSuchMethod(
        Invocation.getter(#productUseCase),
        returnValue: _FakeProducts_0(
          this,
          Invocation.getter(#productUseCase),
        ),
      ) as _i2.Products);

  @override
  _i3.Users get userUseCase => (super.noSuchMethod(
        Invocation.getter(#userUseCase),
        returnValue: _FakeUsers_1(
          this,
          Invocation.getter(#userUseCase),
        ),
      ) as _i3.Users);

  @override
  _i6.Future<_i4.Either<_i7.Failure, List<_i8.ProductEntity>>>
      fetchProducts() => (super.noSuchMethod(
            Invocation.method(
              #fetchProducts,
              [],
            ),
            returnValue: _i6
                .Future<_i4.Either<_i7.Failure, List<_i8.ProductEntity>>>.value(
                _FakeEither_2<_i7.Failure, List<_i8.ProductEntity>>(
              this,
              Invocation.method(
                #fetchProducts,
                [],
              ),
            )),
          ) as _i6.Future<_i4.Either<_i7.Failure, List<_i8.ProductEntity>>>);

  @override
  _i6.Future<_i4.Either<_i7.Failure, _i8.ProductEntity>> fetchSingleProduct(
          int? productId) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchSingleProduct,
          [productId],
        ),
        returnValue:
            _i6.Future<_i4.Either<_i7.Failure, _i8.ProductEntity>>.value(
                _FakeEither_2<_i7.Failure, _i8.ProductEntity>(
          this,
          Invocation.method(
            #fetchSingleProduct,
            [productId],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i7.Failure, _i8.ProductEntity>>);

  @override
  _i6.Future<_i4.Either<_i7.Failure, _i9.CartEntity>> sendProductToCart(
          _i9.CartEntity? cart) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendProductToCart,
          [cart],
        ),
        returnValue: _i6.Future<_i4.Either<_i7.Failure, _i9.CartEntity>>.value(
            _FakeEither_2<_i7.Failure, _i9.CartEntity>(
          this,
          Invocation.method(
            #sendProductToCart,
            [cart],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i7.Failure, _i9.CartEntity>>);

  @override
  _i6.Future<_i4.Either<_i7.Failure, _i10.IdEntity>> sendRegister(
          _i10.UserEntity? userData) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendRegister,
          [userData],
        ),
        returnValue: _i6.Future<_i4.Either<_i7.Failure, _i10.IdEntity>>.value(
            _FakeEither_2<_i7.Failure, _i10.IdEntity>(
          this,
          Invocation.method(
            #sendRegister,
            [userData],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i7.Failure, _i10.IdEntity>>);

  @override
  _i6.Future<_i4.Either<_i7.Failure, _i10.TokenEntity>> sendSignIn(
          _i10.UserEntity? userData) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendSignIn,
          [userData],
        ),
        returnValue:
            _i6.Future<_i4.Either<_i7.Failure, _i10.TokenEntity>>.value(
                _FakeEither_2<_i7.Failure, _i10.TokenEntity>(
          this,
          Invocation.method(
            #sendSignIn,
            [userData],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i7.Failure, _i10.TokenEntity>>);

  @override
  _i6.Future<_i4.Either<_i7.Failure, _i10.UserEntity>> fetchInfo(
          String? idUser) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchInfo,
          [idUser],
        ),
        returnValue: _i6.Future<_i4.Either<_i7.Failure, _i10.UserEntity>>.value(
            _FakeEither_2<_i7.Failure, _i10.UserEntity>(
          this,
          Invocation.method(
            #fetchInfo,
            [idUser],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i7.Failure, _i10.UserEntity>>);

  @override
  _i6.Future<_i4.Either<_i7.Failure, List<String>>> fetchCategories() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchCategories,
          [],
        ),
        returnValue: _i6.Future<_i4.Either<_i7.Failure, List<String>>>.value(
            _FakeEither_2<_i7.Failure, List<String>>(
          this,
          Invocation.method(
            #fetchCategories,
            [],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i7.Failure, List<String>>>);
}
