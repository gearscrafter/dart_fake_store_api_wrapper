// `ApiClient` es una clase que se encarga de realizar solicitudes HTTP a la Fake Store API.
// Utiliza el cliente HTTP proporcionado por el paquete `http` de Dart para enviar y recibir datos desde la API.
// Tiene los siguientes métodos:
// - `get`: Realiza una solicitud GET al endpoint especificado y devuelve la respuesta.
// - `post`: Realiza una solicitud POST al endpoint especificado con el cuerpo de la solicitud proporcionado y devuelve la respuesta.
// - `_processResponse`: Procesa la respuesta recibida del servidor y maneja los diferentes estados de respuesta.

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../errors/exceptions.dart';

/// URL base para la API de Fake Store.
const baseUrl = 'https://fakestoreapi.com/';

/// `ApiClient` es una clase que maneja las solicitudes HTTP a la Fake Store API.
class ApiClient {
  /// Cliente HTTP utilizado para realizar las solicitudes.
  final http.Client httpClient;

  /// Constructor que recibe una instancia de `http.Client`.
  ApiClient(this.httpClient);

  /// Realiza una solicitud GET al endpoint especificado.
  ///
  /// - [endpoint]: El endpoint al que se va a realizar la solicitud.
  ///
  /// Devuelve la respuesta procesada.
  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    return _processResponse(response);
  }

  /// Realiza una solicitud POST al endpoint especificado con el cuerpo de la solicitud proporcionado.
  ///
  /// - [endpoint]: El endpoint al que se va a realizar la solicitud.
  /// - [body]: El cuerpo de la solicitud en formato dinámico.
  ///
  /// Devuelve la respuesta procesada.
  Future<dynamic> post(String endpoint, dynamic body) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return _processResponse(response);
  }

  /// Procesa la respuesta recibida del servidor y maneja los diferentes estados de respuesta.
  ///
  /// - [response]: La respuesta recibida del servidor.
  ///
  /// Devuelve la respuesta decodificada si el estado es 200.
  /// Lanza una excepción `ServerException` si el estado es 500.
  /// Lanza una excepción `GeneralException` para otros estados de error.
  dynamic _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException(
          message: 'Error desconocido: ${response.statusCode}');
    }
  }
}
