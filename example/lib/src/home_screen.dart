import 'package:dart_fake_store_api_wrapper/dart_fake_store_api_wrapper.dart';
import 'package:flutter/material.dart';

import 'details_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DartFakeStoreApiWrapper _apiFake;
  late List<ProductEntity> _products = [];

  @override
  void initState() {
    super.initState();
    _apiFake = DartFakeStoreApiWrapper();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final products = await _apiFake.runFetchProducts();
    setState(() {
      _products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return _products.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen(productId: product.id),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        leading: Image.network(product.image),
                        title: Text(product.title),
                        subtitle: Text(product.description),
                        trailing: Text('\$${product.price}'),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
