# Dart Fake Store API Wrapper

[![pub package](https://img.shields.io/pub/v/dart_fake_store_api_wrapper.svg)](https://pub.dev/packages/dart_fake_store_api_wrapper)
[![GitHub license](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/gearscrafter/dart_fake_store_api_wrapper/blob/main/LICENSE)

Una biblioteca de Dart para interactuar con la [Fake Store API](https://fakestoreapi.com/). Este paquete proporciona una forma sencilla de realizar operaciones CRUD en productos y carritos de compra.

## Características=

- **Obtener productos**: Lista todos los productos disponibles.
- **Obtener un solo producto**: Obtiene detalles de un producto por su ID.
- **Enviar productos al carrito**: Agrega productos a un carrito de compra.

## Instalación

Agrega la dependencia a tu archivo `pubspec.yaml`:

```yaml
dependencies:
  dart_fake_store_api_wrapper: ^0.0.3
```

Luego, ejecuta:
```
dart pub get
```

## Uso Básico
A continuación, se muestra un ejemplo de cómo usar el paquete para obtener productos, obtener un solo producto y enviar productos al carrito.

```
import 'package:dart_fake_store_api_wrapper/dart_fake_store_api_wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _apiWrapper = DartFakeStoreApiWrapper();
  String productsObtained = '';
  String singleProductObtained = '';
  String productAddedToCart = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Obtener todos los productos
      final productos = await _apiWrapper.runFetchProducts();
      setState(() {
        productsObtained = 'Productos obtenidos: ${productos.length}';
      });

      // Obtener un producto por ID
      final producto = await _apiWrapper.runFetchSingleProduct(1);
      setState(() {
        singleProductObtained = 'Producto obtenido: ${producto.title}';
      });

      // Enviar un producto al carrito
      final cart = CartEntity(
        userId: 1,
        date: DateTime.now(),
        products: [
          ProductQuantityEntity(
            productId: 1,
            quantity: 2,
          ),
        ],
      );
      final carrito = await _apiWrapper.runSendProductToCart(cart);
      setState(() {
        for (var cart in carrito.products) {
          productAddedToCart =
              'Cantidad de productos enviados al carrito: ${cart.quantity}';
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productsObtained,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              singleProductObtained,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              productAddedToCart,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


```
# API
## DartFakeStoreApiWrapper
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


