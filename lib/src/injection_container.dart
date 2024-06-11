import 'package:http/http.dart' as http;

import 'core/network/api_client.dart';
import 'domain/repositories/cart_repository.dart';
import 'domain/repositories/product_repository.dart';
import 'domain/use_cases/products.dart';
import 'infrastructure/datasources/remote_data_source.dart';
import 'infrastructure/repositories/repositories.dart';

class Container {
  static final Container _instance = Container._internal();

  factoryContainer() {
    return _instance;
  }

  Container._internal();

  static Container get instance => _instance;

  late RemoteDataSource _productsRemoteDataSource;
  late ProductsRepository _productsRepository;
  late CartRepository _cartRepository;

  late Products _useCase;

  void init() {
    final apiClient = ApiClient(http.Client());

    _productsRemoteDataSource = RemoteDataSourceImpl(apiClient);

    _productsRepository = Repositories(_productsRemoteDataSource);
    _cartRepository = Repositories(_productsRemoteDataSource);

    _useCase = Products(_productsRepository, _cartRepository);
  }

  Products get useCase => _useCase;
}
