import '../../domain/entities/user_entity.dart';

/// La clase `User` representa un usuario en el contexto de tu aplicación.
///
/// Tiene los siguientes atributos:
/// - `email`: El correo electrónico del usuario.
/// - `username`: El nombre de usuario del usuario.
/// - `password`: La contraseña del usuario.
/// - `name`: Una instancia de la clase `Name` que representa el nombre del usuario.
/// - `address`: Una instancia de la clase `Address` que representa la dirección del usuario.
/// - `phone`: El número de teléfono del usuario.
/// - `id`: Una instancia de la clase `Id` que representa el ID del usuario.
/// - `token`: Una instancia de la clase `Token` que representa el token de autenticación del usuario.
class UserModel extends UserEntity {
  UserModel({
    super.email,
    required super.username,
    required super.password,
    super.name,
    super.address,
    super.phone,
  });

  // Convertir User a JSON
  Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
        'password': password,
        'name': (name as NameModel).toJson(),
        'address': (address as AddressModel).toJson(),
        'phone': phone,
      };

  // Crear User desde JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        username: json['username'],
        password: json['password'],
        name: json['name'] != null ? NameModel.fromJson(json['name']) : null,
        address: json['address'] != null
            ? AddressModel.fromJson(json['address'])
            : null,
        phone: json['phone'],
      );
}

/// La clase `Name` representa el nombre de un usuario.
///
/// Tiene los siguientes atributos:
/// - `firstname`: El primer nombre del usuario.
/// - `lastname`: El apellido del usuario.
class NameModel extends NameEntity {
  NameModel({
    required super.firstname,
    required super.lastname,
  });

  // Convertir Name a JSON
  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
      };

  // Crear Name desde JSON
  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        firstname: json['firstname'],
        lastname: json['lastname'],
      );
}

/// La clase `Address` representa la dirección de un usuario.
///
/// Tiene los siguientes atributos:
/// - `city`: La ciudad.
/// - `street`: La calle.
/// - `number`: El número.
/// - `zipcode`: El código postal.
/// - `geolocation`: Una instancia de la clase `Geolocation` que representa la geolocalización.
class AddressModel extends AddressEntity {
  AddressModel({
    required super.city,
    required super.street,
    required super.number,
    required super.zipcode,
    required super.geolocation,
  });

  // Convertir Address a JSON
  Map<String, dynamic> toJson() => {
        'city': city,
        'street': street,
        'number': number,
        'zipcode': zipcode,
        'geolocation': (geolocation as GeolocationModel).toJson(),
      };

  // Crear Address desde JSON
  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        city: json['city'],
        street: json['street'],
        number: json['number'],
        zipcode: json['zipcode'],
        geolocation: GeolocationModel.fromJson(json['geolocation']),
      );
}

/// La clase `Geolocation` representa la geolocalización.
///
/// Tiene los siguientes atributos:
/// - `lat`: La latitud.
/// - `long`: La longitud.
class GeolocationModel extends GeolocationEntity {
  GeolocationModel({
    required super.lat,
    required super.long,
  });

  // Convertir Geolocation a JSON
  Map<String, dynamic> toJson() => {
        'lat': lat,
        'long': long,
      };

  // Crear Geolocation desde JSON
  factory GeolocationModel.fromJson(Map<String, dynamic> json) =>
      GeolocationModel(
        lat: json['lat'],
        long: json['long'],
      );
}

/// La clase `Id` representa el identificador del usuario.
///
/// Tiene el siguiente atributo:
/// - `id`: El identificador.
class IdModel extends IdEntity {
  IdModel({required super.id});

  // Convertir Id a JSON
  Map<String, dynamic> toJson() => {
        'id': id,
      };

  // Crear Id desde JSON
  factory IdModel.fromJson(Map<String, dynamic> json) => IdModel(
        id: json['id'],
      );
}

/// La clase `Token` representa el token de autenticación del usuario.
///
/// Tiene el siguiente atributo:
/// - `token`: El token.
class TokenModel extends TokenEntity {
  TokenModel({required super.token});

  // Convertir Token a JSON
  Map<String, dynamic> toJson() => {
        'token': token,
      };

  // Crear Token desde JSON
  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json['token'],
      );
}
