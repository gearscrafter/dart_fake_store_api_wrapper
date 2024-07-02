import 'package:dart_fake_store_api_wrapper/src/core/errors/exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('ServerException', () {
    test('debería devolver el mensaje por defecto', () {
      // Act
      final exception = ServerException();

      // Assert
      expect(exception.toString(), 'Error en el servidor');
    });

    test('debería devolver el mensaje personalizado', () {
      // Act
      final exception = ServerException('Mensaje personalizado');

      // Assert
      expect(exception.toString(), 'Mensaje personalizado');
    });
  });

  group('CacheException', () {
    test('debería devolver el mensaje por defecto', () {
      // Act
      final exception = CacheException();

      // Assert
      expect(exception.toString(), 'Error de caché');
    });

    test('debería devolver el mensaje personalizado', () {
      // Act
      final exception = CacheException('Mensaje personalizado');

      // Assert
      expect(exception.toString(), 'Mensaje personalizado');
    });
  });

  group('GeneralException', () {
    test('debería devolver el mensaje por defecto', () {
      // Act
      final exception = GeneralException();

      // Assert
      expect(exception.toString(),
          'Ocurrió un problema, por favor intente nuevamente');
    });

    test('debería devolver el mensaje personalizado', () {
      // Act
      final exception = GeneralException(message: 'Mensaje personalizado');

      // Assert
      expect(exception.toString(), 'Mensaje personalizado');
    });
  });
}
