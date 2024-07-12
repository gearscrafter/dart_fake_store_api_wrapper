import 'package:dart_fake_store_api_wrapper/src/core/network/api_client.dart'
    as client;
import 'package:dart_fake_store_api_wrapper/src/domain/repositories/cart_repository.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/repositories/product_repository.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/repositories/user_repository.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/use_cases/products.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/use_cases/users.dart';
import 'package:dart_fake_store_api_wrapper/src/infrastructure/datasources/remote_data_source.dart';
import 'package:dart_fake_store_api_wrapper/src/injection_container.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'container_test.mocks.dart';

@GenerateMocks([
  Container,
  client.ApiClient,
  RemoteDataSource,
  ProductsRepository,
  CartRepository,
  UserRepository,
  Products,
  Users,
])
void main() {
  late MockContainer container;
  late MockProducts mockProductUseCase;
  late MockUsers mockUserUseCase;

  setUp(() {
    container = MockContainer();
    mockProductUseCase = MockProducts();
    mockUserUseCase = MockUsers();

    when(container.productUseCase).thenReturn(mockProductUseCase);
    when(container.userUseCase).thenReturn(mockUserUseCase);

    container.init();
  });

  test('Container initializes dependencies correctly', () {
    container.init();

    expect(container.productUseCase, isA<Products>());
    expect(container.userUseCase, isA<Users>());
  });
}
