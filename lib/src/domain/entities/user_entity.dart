/// La clase `UserEntity` representa un usuario en el contexto de tu aplicación.
///
/// Tiene los siguientes atributos:
/// - `email`: El correo electrónico del usuario, opcional.
/// - `username`: El nombre de usuario del usuario.
/// - `password`: La contraseña del usuario.
/// - `name`: Una instancia de la clase `NameEntity` que representa el nombre del usuario, opcional.
/// - `address`: Una instancia de la clase `AddressEntity` que representa la dirección del usuario, opcional.
/// - `phone`: El número de teléfono del usuario, opcional.
class UserEntity {
  /// El correo electrónico del usuario, opcional.
  final String? email;

  /// El nombre de usuario del usuario.
  final String username;

  /// La contraseña del usuario.
  final String password;

  /// Una instancia de la clase `NameEntity` que representa el nombre del usuario, opcional.
  final NameEntity? name;

  /// Una instancia de la clase `AddressEntity` que representa la dirección del usuario, opcional.
  final AddressEntity? address;

  /// El número de teléfono del usuario, opcional.
  final String? phone;

  /// Constructor para crear una instancia de `UserEntity`.
  const UserEntity({
    this.email,
    required this.username,
    required this.password,
    this.name,
    this.address,
    this.phone,
  });
}

/// La clase `NameEntity` representa el nombre de un usuario.
///
/// Tiene los siguientes atributos:
/// - `firstname`: El primer nombre del usuario.
/// - `lastname`: El apellido del usuario.
class NameEntity {
  /// El primer nombre del usuario.
  final String firstname;

  /// El apellido del usuario.
  final String lastname;

  /// Constructor para crear una instancia de `NameEntity`.
  const NameEntity({
    required this.firstname,
    required this.lastname,
  });
}

/// La clase `AddressEntity` representa la dirección de un usuario.
///
/// Tiene los siguientes atributos:
/// - `city`: La ciudad.
/// - `street`: La calle.
/// - `number`: El número.
/// - `zipcode`: El código postal.
/// - `geolocation`: Una instancia de la clase `GeolocationEntity` que representa la geolocalización.
class AddressEntity {
  /// La ciudad.
  final String city;

  /// La calle.
  final String street;

  /// El número.
  final int number;

  /// El código postal.
  final String zipcode;

  /// Una instancia de la clase `GeolocationEntity` que representa la geolocalización.
  final GeolocationEntity geolocation;

  /// Constructor para crear una instancia de `AddressEntity`.
  const AddressEntity({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });
}

/// La clase `GeolocationEntity` representa la geolocalización.
///
/// Tiene los siguientes atributos:
/// - `lat`: La latitud.
/// - `long`: La longitud.
class GeolocationEntity {
  /// La latitud.
  final String lat;

  /// La longitud.
  final String long;

  /// Constructor para crear una instancia de `GeolocationEntity`.
  const GeolocationEntity({
    required this.lat,
    required this.long,
  });
}

/// La clase `TokenEntity` representa el token de autenticación del usuario.
///
/// Tiene el siguiente atributo:
/// - `token`: El token.
class TokenEntity {
  /// El token de autenticación.
  final String token;

  /// Constructor para crear una instancia de `TokenEntity`.
  TokenEntity({required this.token});
}

/// La clase `IdEntity` representa el identificador del usuario.
///
/// Tiene el siguiente atributo:
/// - `id`: El identificador.
class IdEntity {
  /// El identificador del usuario.
  final int id;

  /// Constructor para crear una instancia de `IdEntity`.
  IdEntity({required this.id});
}
