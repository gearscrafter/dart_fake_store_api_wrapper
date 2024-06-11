// La clase `ProductEntity` representa un producto en el contexto del paquete .
// Tiene los siguientes atributos:
// - `id`: Un identificador único del producto.
// - `title`: El título del producto.
// - `price`: El precio del producto.
// - `description`: La descripción del producto.
// - `category`: La categoría a la que pertenece el producto.
// - `image`: La URL de la imagen del producto.
// - `rating`: Una instancia de la clase `RatingEntity` que representa la calificación del producto.

class ProductEntity {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingEntity rating;

  ProductEntity(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});
}

// La clase `RatingEntity` representa la calificación de un producto en el contexto del paquete.
// Tiene los siguientes atributos:
// - `rate`: El puntaje promedio del producto.
// - `count`: El número total de calificaciones recibidas por el producto.

class RatingEntity {
  final double rate;
  final int count;

  RatingEntity({required this.rate, required this.count});
}
