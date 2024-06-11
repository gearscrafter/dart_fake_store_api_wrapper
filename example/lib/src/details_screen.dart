import 'package:dart_fake_store_api_wrapper/dart_fake_store_api_wrapper.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late DartFakeStoreApiWrapper _apiFake;
  ProductEntity? _product;
  bool _isLoading = false;
  int _quantityProduct = 1;

  @override
  void initState() {
    super.initState();
    _apiFake = DartFakeStoreApiWrapper();
    _fetchSingleProduct(widget.productId);
  }

  Future<void> _fetchSingleProduct(int productId) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final product = await _apiFake.runFetchSingleProduct(productId);
      setState(() {
        _product = product;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Fallo en añadir el carrito $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _addToCart() async {
    if (_product != null) {
      setState(() {
        _isLoading = true;
      });
      try {
        await _apiFake.runSendProductToCart(
          CartEntity(
            userId: 1,
            date: DateTime.now(),
            products: [
              ProductQuantityEntity(
                productId: _product!.id,
                quantity: _quantityProduct,
              ),
            ],
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('¡Producto añadido al carrito exitosamente!'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Fallo en añadir el producto al carrito: $e'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del producto'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _product != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_product?.image != null)
                          Center(
                            child: Image.network(
                              _product!.image,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                        const SizedBox(height: 20),
                        Text(
                          _product!.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '\$${_product!.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _product!.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (_quantityProduct > 1) {
                                    _quantityProduct--;
                                  }
                                });
                              },
                            ),
                            Text(
                              '$_quantityProduct',
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _quantityProduct++;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: _quantityProduct > 0 ? _addToCart : null,
                            icon: const Icon(Icons.add_shopping_cart),
                            label: const Text('Añadir al carrito'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: Text('Detalles del producto no disponible')),
    );
  }
}
