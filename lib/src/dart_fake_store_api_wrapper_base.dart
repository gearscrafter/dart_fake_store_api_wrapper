import 'domain/entities/user_entity.dart';
import 'injection_container.dart' as dependency_injection;
import 'application/shopping_cart_application.dart';
import 'domain/entities/cart_entity.dart';
import 'domain/entities/product_entity.dart';

// Clase que actúa como interfaz para interactuar con la Fake Store API.
class DartFakeStoreApiWrapper {
  late final ShoppingCartApplication _shoppingCartApp;

  DartFakeStoreApiWrapper() {
    _initializeShoppingCartApp();
  }

  Future<void> _initializeShoppingCartApp() async {
    dependency_injection.Container.instance.init();
    _shoppingCartApp = ShoppingCartApplication(
        dependency_injection.Container.instance.productUseCase,
        dependency_injection.Container.instance.userUseCase);
  }

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
}
