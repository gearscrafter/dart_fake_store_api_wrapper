// La clase `CartEntity` representa un carrito de compras en el contexto del paquete
// Tiene los siguientes atributos:
// - `id`: Un identificador único del carrito, opcional ya que puede ser nulo
//         cuando se envie el request a la API, caso contratrario el response te devuelve el id.
// - `userId`: El identificador del usuario al que pertenece el carrito.
// - `date`: La fecha en la que se creó el carrito.
// - `products`: Una lista de entidades `ProductQuantityEntity`, que representan los productos en el carrito junto con su cantidad.

class CartEntity {
  int? id;
  int userId;
  DateTime date;
  List<ProductQuantityEntity> products;

  CartEntity({
    this.id,
    required this.userId,
    required this.date,
    required this.products,
  });
}

// La clase `ProductQuantityEntity` representa un producto dentro del carrito, junto con su cantidad.
// Tiene los siguientes atributos:
// - `productId`: El identificador único del producto.
// - `quantity`: La cantidad de este producto en el carrito.
//
// Además, la clase `ProductQuantityEntity` tiene un método `toJson()` que convierte la entidad
// en un mapa de cadenas dinámicas, lo que facilita la serialización de la entidad a formato JSON
// para su uso en la comunicación con una API.

class ProductQuantityEntity {
  int productId;
  int quantity;

  ProductQuantityEntity({
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}
