class UserEntity {
  final String? email;
  final String username;
  final String password;
  final NameEntity? name;
  final AddressEntity? address;
  final String? phone;

  const UserEntity({
    this.email,
    required this.username,
    required this.password,
    this.name,
    this.address,
    this.phone,
  });
}

class NameEntity {
  final String firstname;
  final String lastname;

  const NameEntity({
    required this.firstname,
    required this.lastname,
  });
}

class AddressEntity {
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final GeolocationEntity geolocation;

  const AddressEntity({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });
}

class GeolocationEntity {
  final String lat;
  final String long;

  const GeolocationEntity({
    required this.lat,
    required this.long,
  });
}

class TokenEntity {
  final String token;
  TokenEntity({required this.token});
}

class IdEntity {
  final int id;
  IdEntity({required this.id});
}
