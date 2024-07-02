import 'package:dart_fake_store_api_wrapper/src/domain/entities/user_entity.dart';
import 'package:test/test.dart';

void main() {
  group('NameEntity', () {
    test('debería inicializarse correctamente', () {
      // Act
      final name = NameEntity(firstname: 'John', lastname: 'Doe');

      // Assert
      expect(name.firstname, 'John');
      expect(name.lastname, 'Doe');
    });
  });

  group('UserEntity', () {
    test('debería inicializarse correctamente', () {
      // Arrange
      final name = NameEntity(firstname: 'John', lastname: 'Doe');
      final geolocation = GeolocationEntity(lat: '123.456', long: '789.012');
      final address = AddressEntity(
        city: 'City',
        street: 'Street',
        number: 123,
        zipcode: '12345',
        geolocation: geolocation,
      );

      // Act
      final user = UserEntity(
        email: 'john.doe@example.com',
        username: 'johndoe',
        password: 'password123',
        name: name,
        address: address,
        phone: '1234567890',
      );

      // Assert
      expect(user.email, 'john.doe@example.com');
      expect(user.username, 'johndoe');
      expect(user.password, 'password123');
      expect(user.name, name);
      expect(user.address, address);
      expect(user.phone, '1234567890');
    });

    test('debería permitir valores nulos para email, name, address y phone',
        () {
      // Act
      final user = UserEntity(
        username: 'johndoe',
        password: 'password123',
      );

      // Assert
      expect(user.email, isNull);
      expect(user.name, isNull);
      expect(user.address, isNull);
      expect(user.phone, isNull);
      expect(user.username, 'johndoe');
      expect(user.password, 'password123');
    });
  });

  group('TokenEntity', () {
    test('debería inicializarse correctamente', () {
      // Act
      final token = TokenEntity(token: '123456');

      // Assert
      expect(token.token, '123456');
    });
  });

  group('IdEntity', () {
    test('debería inicializarse correctamente', () {
      // Act
      final idEntity = IdEntity(id: 1);

      // Assert
      expect(idEntity.id, 1);
    });
  });
}
