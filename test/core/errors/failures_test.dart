import 'package:dart_fake_store_api_wrapper/src/core/errors/failures.dart';
import 'package:test/test.dart';

void main() {
  group('Failure', () {
    test('debería inicializarse correctamente con el mensaje', () {
      // Act
      final failure = ServerFailure('Error en el servidor');

      // Assert
      expect(failure.message, 'Error en el servidor');
      expect(failure.toString(), 'Error en el servidor');
    });
  });

  group('ServerFailure', () {
    test('debería devolver el mensaje correctamente', () {
      // Act
      final failure = ServerFailure('Error en el servidor');

      // Assert
      expect(failure.message, 'Error en el servidor');
      expect(failure.toString(), 'Error en el servidor');
    });
  });

  group('CacheFailure', () {
    test('debería devolver el mensaje correctamente', () {
      // Act
      final failure = CacheFailure('Error de caché');

      // Assert
      expect(failure.message, 'Error de caché');
      expect(failure.toString(), 'Error de caché');
    });
  });

  group('GeneralFailure', () {
    test('debería devolver el mensaje correctamente', () {
      // Act
      final failure = GeneralFailure('Ocurrió un problema');

      // Assert
      expect(failure.message, 'Ocurrió un problema');
      expect(failure.toString(), 'Ocurrió un problema');
    });
  });
}
