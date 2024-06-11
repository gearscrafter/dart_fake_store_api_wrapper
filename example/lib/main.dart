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

      // Obtener un solo producto por ID
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
