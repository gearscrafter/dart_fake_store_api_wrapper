import 'package:http/http.dart' as http;

import 'core/network/api_client.dart';
import 'domain/repositories/cart_repository.dart';
import 'domain/repositories/product_repository.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/use_cases/products.dart';
import 'domain/use_cases/users.dart';
import 'infrastructure/datasources/remote_data_source.dart';
import 'infrastructure/repositories/repositories.dart';

class Container {
  static final Container _instance = Container._internal();

  factoryContainer() {
    return _instance;
  }

  Container._internal();

  static Container get instance => _instance;

  late RemoteDataSource _remoteDataSource;
  late ProductsRepository _productsRepository;
  late CartRepository _cartRepository;
  late UserRepository _userRepository;

  late Products _productUseCase;
  late Users _userUseCase;

  void init() {
    final apiClient = ApiClient(http.Client());

    _remoteDataSource = RemoteDataSourceImpl(apiClient);

    _productsRepository = Repositories(_remoteDataSource);
    _cartRepository = Repositories(_remoteDataSource);

    _productUseCase = Products(_productsRepository, _cartRepository);
    _userUseCase = Users(_userRepository);
  }

  Products get productUseCase => _productUseCase;
  Users get userUseCase => _userUseCase;
}
