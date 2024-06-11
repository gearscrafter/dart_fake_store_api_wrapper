import 'injection_container.dart' as di;
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
    di.InjectionContainer.instance.init();
    _shoppingCartApp = ShoppingCartApplication(
      di.InjectionContainer.instance.getProducts,
      di.InjectionContainer.instance.getSingleProduct,
      di.InjectionContainer.instance.sendProductToCart,
    );
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
    final result = await _shoppingCartApp.getSingleProduct(productId);

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
    final result = await _shoppingCartApp.sendProduct(cart);

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
}
