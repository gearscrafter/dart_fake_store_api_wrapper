import 'package:http/http.dart' as http;

import 'core/network/api_client.dart';
import 'domain/repositories/cart_repository.dart';
import 'domain/repositories/product_repository.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/use_cases/products.dart';
import 'domain/use_cases/users.dart';
import 'infrastructure/datasources/remote_data_source.dart';
import 'infrastructure/repositories/repositories.dart';

/// Clase Container
///
/// Gestiona la inyección de dependencias para la aplicación.
/// Implementa el patrón de diseño Singleton.
class Container {
  /// La única instancia de Container
  static final Container _instance = Container._internal();

  factoryContainer() {
    return _instance;
  }

  /// Constructor privado para implementar el patrón Singleton.
  Container._internal();

  static Container get instance => _instance;

  /// Fuente de datos remota para obtener datos de la API.
  late RemoteDataSource _remoteDataSource;

  /// Repositorios.
  late ProductsRepository _productsRepository;
  late CartRepository _cartRepository;
  late UserRepository _userRepository;

  /// Caso de uso para gestionar productos.
  late Products _productUseCase;

  /// Caso de uso para gestionar usuarios.
  late Users _userUseCase;

  /// Inicializa las dependencias de la aplicación.
  void init() {
    final apiClient = ApiClient(http.Client());

    _remoteDataSource = RemoteDataSourceImpl(apiClient);

    _productsRepository = Repositories(_remoteDataSource);
    _cartRepository = Repositories(_remoteDataSource);
    _userRepository = Repositories(_remoteDataSource);

    _productUseCase = Products(_productsRepository, _cartRepository);
    _userUseCase = Users(_userRepository);
  }

  Products get productUseCase => _productUseCase;
  Users get userUseCase => _userUseCase;
}
