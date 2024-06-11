import 'package:dart_fake_store_api_wrapper/src/domain/use_cases/products.dart';
import 'package:dart_fake_store_api_wrapper/src/injection_container.dart';

import 'package:test/test.dart';

void main() {
  group('InjectionContainer', () {
    late Container injectionContainer;

    setUp(() {
      injectionContainer = Container.instance;

      injectionContainer.init();
    });

    test('GetProducts devuelve una instancia válida', () {
      expect(injectionContainer.useCase, isA<Products>());
    });
  });
}
