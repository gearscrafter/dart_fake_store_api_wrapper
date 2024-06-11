import 'package:dart_fake_store_api_wrapper/src/injection_container.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/use_cases/get_products.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/use_cases/get_single_product.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/use_cases/send_product_to_cart.dart';

import 'package:test/test.dart';

void main() {
  group('InjectionContainer', () {
    late InjectionContainer injectionContainer;

    setUp(() {
      injectionContainer = InjectionContainer.instance;

      injectionContainer.init();
    });

    test('GetProducts devuelve una instancia válida', () {
      expect(injectionContainer.getProducts, isA<GetProducts>());
    });

    test('GetSingleProduct devuelve una instancia válida', () {
      expect(injectionContainer.getSingleProduct, isA<GetSingleProduct>());
    });

    test('SendProductToCart devuelve una instancia válida', () {
      expect(injectionContainer.sendProductToCart, isA<SendProductToCart>());
    });
  });
}
