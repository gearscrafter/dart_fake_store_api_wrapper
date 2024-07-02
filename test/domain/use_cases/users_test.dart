import 'package:dart_fake_store_api_wrapper/src/core/errors/failures.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/entities/user_entity.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/repositories/user_repository.dart';
import 'package:dart_fake_store_api_wrapper/src/domain/use_cases/users.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../container_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late Users users;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    users = Users(mockUserRepository);
  });

  group('Users', () {
    group('callRegister', () {
      final userData = UserEntity(
        email: 'john.doe@example.com',
        username: 'johndoe',
        password: 'password123',
        name: null,
        address: null,
        phone: null,
      );
      final idEntity = IdEntity(id: 1);

      test('debería retornar Right con IdEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockUserRepository.register(userData))
            .thenAnswer((_) async => Right(idEntity));

        // Act
        final result = await users.callRegister(userData);

        // Assert
        expect(result, Right(idEntity));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockUserRepository.register(userData))
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await users.callRegister(userData);

        // Assert
        expect(result, Left(failure));
      });
    });

    group('callSignIn', () {
      final userData = UserEntity(
        email: 'john.doe@example.com',
        username: 'johndoe',
        password: 'password123',
        name: null,
        address: null,
        phone: null,
      );
      final tokenEntity = TokenEntity(token: '123456');

      test(
          'debería retornar Right con TokenEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockUserRepository.signIn(userData))
            .thenAnswer((_) async => Right(tokenEntity));

        // Act
        final result = await users.callSignIn(userData);

        // Assert
        expect(result, Right(tokenEntity));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockUserRepository.signIn(userData))
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await users.callSignIn(userData);

        // Assert
        expect(result, Left(failure));
      });
    });

    group('callInfo', () {
      final idUser = '1';
      final userEntity = UserEntity(
        email: 'john.doe@example.com',
        username: 'johndoe',
        password: 'password123',
        name: NameEntity(firstname: 'John', lastname: 'Doe'),
        address: AddressEntity(
          city: 'City',
          street: 'Street',
          number: 123,
          zipcode: '12345',
          geolocation: GeolocationEntity(lat: '123.456', long: '789.012'),
        ),
        phone: '1234567890',
      );

      test('debería retornar Right con UserEntity cuando la llamada es exitosa',
          () async {
        // Arrange
        when(mockUserRepository.getInfo(idUser))
            .thenAnswer((_) async => Right(userEntity));

        // Act
        final result = await users.callInfo(idUser);

        // Assert
        expect(result, Right(userEntity));
      });

      test('debería retornar Failure cuando la llamada falla', () async {
        // Arrange
        final failure = ServerFailure('Error en el servidor');
        when(mockUserRepository.getInfo(idUser))
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await users.callInfo(idUser);

        // Assert
        expect(result, Left(failure));
      });
    });
  });
}
