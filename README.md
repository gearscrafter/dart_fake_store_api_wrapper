# Dart Fake Store API Wrapper

[![pub package](https://img.shields.io/pub/v/dart_fake_store_api_wrapper.svg)](https://pub.dev/packages/dart_fake_store_api_wrapper)
[![GitHub license](https://img.shields.io/github/license/gearscrafter/.svg)](https://github.com/tu_usuario/tu_repositorio/blob/main/LICENSE)

Una biblioteca de Dart para interactuar con la [Fake Store API](https://fakestoreapi.com/). Este paquete proporciona una forma sencilla de realizar operaciones CRUD en productos y carritos de compra.

## Características

- **Obtener productos**: Lista todos los productos disponibles.
- **Obtener un solo producto**: Obtiene detalles de un producto por su ID.
- **Enviar productos al carrito**: Agrega productos a un carrito de compra.

## Instalación

Agrega la dependencia a tu archivo `pubspec.yaml`:

```yaml
dependencies:
  dart_fake_store_api_wrapper: ^1.0.0
```

Luego, ejecuta:
```
dart pub get
```

## Uso Básico
A continuación, se muestra un ejemplo de cómo usar el paquete para obtener productos, obtener un solo producto y enviar productos al carrito.

```
import 'package:dart_fake_store_api_wrapper/dart_fake_store_api_wrapper.dart';

void main() async {
  final apiWrapper = DartFakeStoreApiWrapper();

  // Obtener todos los productos
  try {
    final productos = await apiWrapper.runFetchProducts();
    print('Productos obtenidos: ${productos.length}');
  } catch (e) {
    print(e);
  }

  // Obtener un solo producto por ID
  try {
    final producto = await apiWrapper.runFetchSingleProduct(1);
    print('Producto obtenido: ${producto.title}');
  } catch (e) {
    print(e);
  }

  // Enviar un producto al carrito
  try {
    final cart = CartEntity(
      id: 1,
      userId: 1,
      date: DateTime.now().toString(),
      products: [CartProduct(productId: 1, quantity: 2)],
    );
    final carrito = await apiWrapper.runSendProductToCart(cart);
    print('Producto enviado al carrito: ${carrito.id}');
  } catch (e) {
    print(e);
  }
}
```
- En la carpeta `example` se incluye un ejemplo más completo de cómo utilizar este paquete.
# API
## DartFakeStoreApiWrapper
### initializeShoppingCartApp
```
Future<void> initializeShoppingCartApp();
```

Inicializa la aplicación de carrito de compras. Debe llamarse antes de realizar cualquier otra operación.

### runFetchProducts
```
Future<List<ProductEntity>> runFetchProducts();
```
Obtiene la lista de productos disponibles.

### runFetchSingleProduct
```
Future<ProductEntity> runFetchSingleProduct(int productId);
```
Obtiene detalles de un solo producto por su ID.

### runSendProductToCart
```
Future<CartEntity> runSendProductToCart(CartEntity cart);
```
Agrega un producto al carrito de compra.

## Modelos
### ProductEntity
```
class ProductEntity {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final double rating;
  final String image;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.rating,
    required this.image,
  });
}
```

Representa un producto con sus detalles.

### CartEntity
```
class CartEntity {
  final int id;
  final int userId;
  final String date;
  final List<CartProduct> products;

  CartEntity({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });
}
```

Representa un carrito de compras.

### CartProduct
```
class CartProduct {
  final int productId;
  final int quantity;

  CartProduct({
    required this.productId,
    required this.quantity,
  });
}
```
Representa un producto dentro de un carrito de compras.

## Contribuir
Si deseas contribuir a este proyecto, sigue los pasos a continuación:

- Haz un fork del proyecto.
- Crea una nueva rama (git checkout -b feature-nueva-funcionalidad).
- Realiza tus cambios y haz commit (git commit -am 'Añadir nueva funcionalidad').
- Haz push a la rama (git push origin feature-nueva-funcionalidad).
Abre un Pull Request.
Asegúrate de que tu código sigue las convenciones de Dart y pasa todas las pruebas existentes.

## Licencia
Este proyecto está licenciado bajo la licencia MIT - mira el archivo LICENSE para más detalles.


