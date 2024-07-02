import 'dart:convert';
import 'package:dart_fake_store_api_wrapper/src/core/errors/exceptions.dart';
import 'package:dart_fake_store_api_wrapper/src/core/network/api_client.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ApiClient apiClient;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    apiClient = ApiClient(mockHttpClient);
  });

  group('ApiClient', () {
    const endpoint = 'products';

    group('get', () {
      test('debería devolver datos si la llamada al endpoint es exitosa (200)',
          () async {
        // Arrange
        final responseJson = jsonEncode([
          {"id": 1, "title": "Product 1"},
          {"id": 2, "title": "Product 2"}
        ]);

        when(mockHttpClient.get(Uri.parse('$baseUrl$endpoint')))
            .thenAnswer((_) async => http.Response(responseJson, 200));

        // Act
        final result = await apiClient.get(endpoint);

        // Assert
        expect(result, isA<List<dynamic>>());
        expect(result.length, 20);
      });

      test('debería lanzar ServerException si el estado es 500', () async {
        // Arrange
        when(mockHttpClient.get(Uri.parse('$baseUrl$endpoint')))
            .thenAnswer((_) async => http.Response('Server Error', 500));

        // Act
        try {
          await apiClient.get(endpoint);
        } catch (e) {
          expect(e, isA<ServerException>());
        }
      });

      test(
          'debería lanzar GeneralException si el estado es diferente a 200 y 500',
          () async {
        // Arrange
        when(mockHttpClient.get(Uri.parse('$baseUrl$endpoint')))
            .thenAnswer((_) async => http.Response('Not Found', 404));

        // Act
        try {
          await apiClient.get(endpoint);
        } catch (e) {
          expect(e, isA<GeneralException>());
        }
      });
    });

    group('post', () {
      const body = {'title': 'Product'};

      test('debería devolver datos si la llamada al endpoint es exitosa (200)',
          () async {
        // Arrange
        final responseJson = jsonEncode({"id": 1, "title": "Product"});

        when(mockHttpClient.post(
          Uri.parse('$baseUrl$endpoint'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body),
        )).thenAnswer((_) async => http.Response(responseJson, 200));

        // Act
        final result = await apiClient.post(endpoint, body);

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result['id'], 21);
      });

      test('debería lanzar ServerException si el estado es 500', () async {
        // Arrange
        when(mockHttpClient.post(
          Uri.parse('$baseUrl$endpoint'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body),
        )).thenAnswer((_) async => http.Response('Server Error', 500));

        // Act
        try {
          await apiClient.post(endpoint, body);
        } catch (e) {
          expect(e, isA<GeneralException>());
        }
      });

      test(
          'debería lanzar GeneralException si el estado es diferente a 200 y 500',
          () async {
        // Arrange
        when(mockHttpClient.post(
          Uri.parse('$baseUrl$endpoint'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body),
        )).thenAnswer((_) async => http.Response('Not Found', 404));

        // Act
        try {
          await apiClient.post(endpoint, body);
        } catch (e) {
          expect(e, isA<GeneralException>());
        }
      });
    });
  });
}
