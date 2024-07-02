import 'package:dart_fake_store_api_wrapper/src/infrastructure/models/user_model.dart';
import 'package:test/test.dart';

void main() {
  group('UserModel', () {
    final nameJson = {
      'firstname': 'John',
      'lastname': 'Doe',
    };

    final geolocationJson = {
      'lat': '123.456',
      'long': '789.012',
    };

    final addressJson = {
      'city': 'City',
      'street': 'Street',
      'number': 123,
      'zipcode': '12345',
      'geolocation': geolocationJson,
    };

    final userJson = {
      'email': 'john.doe@example.com',
      'username': 'johndoe',
      'password': 'password123',
      'name': nameJson,
      'address': addressJson,
      'phone': '1234567890',
    };

    final nameModel = NameModel(
      firstname: 'John',
      lastname: 'Doe',
    );

    final geolocationModel = GeolocationModel(
      lat: '123.456',
      long: '789.012',
    );

    final addressModel = AddressModel(
      city: 'City',
      street: 'Street',
      number: 123,
      zipcode: '12345',
      geolocation: geolocationModel,
    );

    final userModel = UserModel(
      email: 'john.doe@example.com',
      username: 'johndoe',
      password: 'password123',
      name: nameModel,
      address: addressModel,
      phone: '1234567890',
    );

    group('fromJson', () {
      test('debería crear una instancia válida desde JSON', () {
        // Act
        final result = UserModel.fromJson(userJson);

        // Assert
        expect(result, isA<UserModel>());
        expect(result.email, 'john.doe@example.com');
        expect(result.username, 'johndoe');
        expect(result.password, 'password123');
        expect(result.name, isA<NameModel>());
        expect(result.address, isA<AddressModel>());
        expect(result.phone, '1234567890');
      });
    });

    group('toJson', () {
      test('debería convertir una instancia a JSON correctamente', () {
        // Act
        final result = userModel.toJson();

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result['email'], 'john.doe@example.com');
        expect(result['username'], 'johndoe');
        expect(result['password'], 'password123');
        expect(result['name'], nameJson);
        expect(result['address'], addressJson);
        expect(result['phone'], '1234567890');
      });
    });
  });

  group('NameModel', () {
    final nameJson = {
      'firstname': 'John',
      'lastname': 'Doe',
    };

    final nameModel = NameModel(
      firstname: 'John',
      lastname: 'Doe',
    );

    group('fromJson', () {
      test('debería crear una instancia válida desde JSON', () {
        // Act
        final result = NameModel.fromJson(nameJson);

        // Assert
        expect(result, isA<NameModel>());
        expect(result.firstname, 'John');
        expect(result.lastname, 'Doe');
      });
    });

    group('toJson', () {
      test('debería convertir una instancia a JSON correctamente', () {
        // Act
        final result = nameModel.toJson();

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result['firstname'], 'John');
        expect(result['lastname'], 'Doe');
      });
    });
  });

  group('AddressModel', () {
    final geolocationJson = {
      'lat': '123.456',
      'long': '789.012',
    };

    final addressJson = {
      'city': 'City',
      'street': 'Street',
      'number': 123,
      'zipcode': '12345',
      'geolocation': geolocationJson,
    };

    final geolocationModel = GeolocationModel(
      lat: '123.456',
      long: '789.012',
    );

    final addressModel = AddressModel(
      city: 'City',
      street: 'Street',
      number: 123,
      zipcode: '12345',
      geolocation: geolocationModel,
    );

    group('fromJson', () {
      test('debería crear una instancia válida desde JSON', () {
        // Act
        final result = AddressModel.fromJson(addressJson);

        // Assert
        expect(result, isA<AddressModel>());
        expect(result.city, 'City');
        expect(result.street, 'Street');
        expect(result.number, 123);
        expect(result.zipcode, '12345');
        expect(result.geolocation, isA<GeolocationModel>());
        expect(result.geolocation.lat, '123.456');
        expect(result.geolocation.long, '789.012');
      });
    });

    group('toJson', () {
      test('debería convertir una instancia a JSON correctamente', () {
        // Act
        final result = addressModel.toJson();

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result['city'], 'City');
        expect(result['street'], 'Street');
        expect(result['number'], 123);
        expect(result['zipcode'], '12345');
        expect(result['geolocation'], geolocationJson);
      });
    });
  });

  group('GeolocationModel', () {
    final geolocationJson = {
      'lat': '123.456',
      'long': '789.012',
    };

    final geolocationModel = GeolocationModel(
      lat: '123.456',
      long: '789.012',
    );

    group('fromJson', () {
      test('debería crear una instancia válida desde JSON', () {
        // Act
        final result = GeolocationModel.fromJson(geolocationJson);

        // Assert
        expect(result, isA<GeolocationModel>());
        expect(result.lat, '123.456');
        expect(result.long, '789.012');
      });
    });

    group('toJson', () {
      test('debería convertir una instancia a JSON correctamente', () {
        // Act
        final result = geolocationModel.toJson();

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result['lat'], '123.456');
        expect(result['long'], '789.012');
      });
    });
  });

  group('IdModel', () {
    final idJson = {
      'id': 1,
    };

    final idModel = IdModel(
      id: 1,
    );

    group('fromJson', () {
      test('debería crear una instancia válida desde JSON', () {
        // Act
        final result = IdModel.fromJson(idJson);

        // Assert
        expect(result, isA<IdModel>());
        expect(result.id, 1);
      });
    });

    group('toJson', () {
      test('debería convertir una instancia a JSON correctamente', () {
        // Act
        final result = idModel.toJson();

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result['id'], 1);
      });
    });
  });

  group('TokenModel', () {
    final tokenJson = {
      'token': '123456',
    };

    final tokenModel = TokenModel(
      token: '123456',
    );

    group('fromJson', () {
      test('debería crear una instancia válida desde JSON', () {
        // Act
        final result = TokenModel.fromJson(tokenJson);

        // Assert
        expect(result, isA<TokenModel>());
        expect(result.token, '123456');
      });
    });

    group('toJson', () {
      test('debería convertir una instancia a JSON correctamente', () {
        // Act
        final result = tokenModel.toJson();

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result['token'], '123456');
      });
    });
  });
}
