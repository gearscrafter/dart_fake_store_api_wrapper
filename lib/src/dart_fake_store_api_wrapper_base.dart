import 'domain/entities/user_entity.dart';
import 'injection_container.dart' as dependency_injection;
import 'application/shopping_cart_application.dart';
import 'domain/entities/cart_entity.dart';
import 'domain/entities/product_entity.dart';

/// Clase que actúa como interfaz para interactuar con la Fake Store API.
class DartFakeStoreApiWrapper {
  /// Instancia de la aplicación del carrito de compras.
  late final ShoppingCartApplication _shoppingCartApp;

  /// Constructor de la clase que permite inyectar una instancia de [ShoppingCartApplication].
  DartFakeStoreApiWrapper([ShoppingCartApplication? shoppingCartApp]) {
    if (shoppingCartApp == null) {
      _initializeShoppingCartApp();
    } else {
      _shoppingCartApp = shoppingCartApp;
    }
  }

  /// Inicializa la aplicación del carrito de compras.
  Future<void> _initializeShoppingCartApp() async {
    dependency_injection.Container.instance.init();
    _shoppingCartApp = ShoppingCartApplication(
        dependency_injection.Container.instance.productUseCase,
        dependency_injection.Container.instance.userUseCase);
  }

  /// Método para obtener la lista de productos.
  Future<List<ProductEntity>> runFetchProducts() async {
    final result = await _shoppingCartApp.fetchProducts();
    return result.fold(
      (failure) {
        throw Exception('Error al obtener los productos: ${failure.message}');
      },
      (products) {
        print('\nObteniendo productos:');
        for (var product in products) {
          _printProductDetails(product);
        }
        return products;
      },
    );
  }

  /// Método para obtener un solo producto por su ID.
  Future<ProductEntity> runFetchSingleProduct(int productId) async {
    final result = await _shoppingCartApp.fetchSingleProduct(productId);
    return result.fold(
      (failure) {
        throw Exception('Error al obtener el producto: ${failure.message}');
      },
      (product) {
        print('\nObtener el producto:');
        _printProductDetails(product);
        return product;
      },
    );
  }

  /// Método para enviar un producto al carrito.
  Future<CartEntity> runSendProductToCart(CartEntity cart) async {
    final result = await _shoppingCartApp.sendProductToCart(cart);
    return result.fold(
      (failure) {
        throw Exception(
            'Error al enviar el producto al carrito de compras: ${failure.message}');
      },
      (cart) {
        print('\nProducto enviado exitosamente:  🚀\n');
        _printCartDetails(cart);
        return cart;
      },
    );
  }

  /// Método para registrar un nuevo usuario.
  Future<IdEntity> runSendRegister(UserEntity userData) async {
    final result = await _shoppingCartApp.sendRegister(userData);
    return result.fold(
      (failure) {
        throw Exception('Error al registrar al usuario: ${failure.message}');
      },
      (id) {
        print('\nRegistro del usuario exitoso:  🚀\n');
        print('El id del usuario registrado es: $id');
        return id;
      },
    );
  }

  /// Método para iniciar sesión de un usuario.
  Future<TokenEntity> runSendSignIn(UserEntity userData) async {
    final result = await _shoppingCartApp.sendSignIn(userData);
    return result.fold(
      (failure) {
        throw Exception('Error al hacer login: ${failure.message}');
      },
      (token) {
        print('\nIngreso de inicio de sesión exitosa:  🚀\n');
        print('El token obtenido es: $token');
        return token;
      },
    );
  }

  /// Método para obtener la información de un usuario por su ID.
  Future<UserEntity> runFetchInfo(String idUser) async {
    final result = await _shoppingCartApp.fetchInfo(idUser);
    return result.fold(
      (failure) {
        throw Exception(
            'Error al obtener la info del usuario: ${failure.message}');
      },
      (user) {
        print('\nObtenido la info del usuario:  🚀\n');
        _printUserDetails(user);
        return user;
      },
    );
  }

  /// Método para obtener la lista de categorías.
  Future<List<String>> runFetchCategories() async {
    final result = await _shoppingCartApp.fetchCategories();
    return result.fold(
      (failure) {
        throw Exception('Error al obtener las categorias: ${failure.message}');
      },
      (categories) {
        print('\nSe obtuvo la lista de categorias:');
        _printCategories(categories);
        return categories;
      },
    );
  }

  /// Método auxiliar para imprimir los detalles de un producto.
  static void _printProductDetails(ProductEntity product) {
    print('======= Detalle del producto ======');
    print('ID: ${product.id}');
    print('Título: ${product.title}');
    print('Precio: \$${product.price} 💰');
    print('Descripción: ${product.description}');
    print('Categoría: ${product.category}');
    print('Rating: ${product.rating} ⭐');
    print('Imagen: ${product.image}\n');
  }

  /// Método auxiliar para imprimir los detalles de un carrito.
  static void _printCartDetails(CartEntity cart) {
    print('======= Detalles del carrito ======');
    print('ID: ${cart.id}');
    print('Id del usuario: ${cart.userId}');
    print('Fecha: ${cart.date}');
    for (var product in cart.products) {
      print('======= Detalle del producto ======');
      print('Id: ${product.productId}');
      print('Cantidad: ${product.quantity}');
    }
  }

  /// Método auxiliar para imprimir los detalles de un usuario.
  static void _printUserDetails(UserEntity user) {
    print('======= Detalles del usuario ======');
    print('Nombre: ${user.name}');
    print('Username: ${user.username}');
    print('Password: ${user.password}');
    print('Email: ${user.email}');
    print('Telefono: ${user.phone}');
    print('Ciudad: ${user.address?.city ?? ''}');
    print('Calle: ${user.address?.street ?? ''}');
    print('Latitud: ${user.address?.geolocation.lat ?? ''}');
    print('Longitud: ${user.address?.geolocation.long ?? ''}');
  }

  /// Método auxiliar para imprimir las categorías.
  static void _printCategories(List<String> object) {
    print('======= Detalle del producto ======');
    for (var category in object) {
      print('category: $category ⭐');
    }
  }
}
