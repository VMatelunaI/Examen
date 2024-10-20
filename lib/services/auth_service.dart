// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/foundation.dart';
import 'dart:convert'; // Importa la librería para trabajar con JSON
import 'package:http/http.dart'
    as http; // Importa la librería HTTP para realizar peticiones

// Servicio de autenticación que maneja el login y el registro de usuarios con Firebase
class AuthService extends ChangeNotifier {
  // Base URL para Firebase Authentication y el token de API para realizar las solicitudes
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyCwQYMMlROaHlO12wGuTuIwBxTezL2iBdU';

  // Método para iniciar sesión con email y contraseña
  Future<String?> login(String email, String password) async {
    // Datos de autenticación que se envían en la solicitud
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    // Construcción de la URL de Firebase para iniciar sesión
    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    if (kDebugMode) {
      print(authData);
    } // Imprime los datos de autenticación para verificar

    // Realiza la solicitud POST a Firebase para iniciar sesión
    final response = await http.post(url, body: json.encode(authData));

    // Decodifica la respuesta en formato JSON
    final Map<String, dynamic> decodeResponse = json.decode(response.body);

    // Si la respuesta contiene un 'idToken', el login fue exitoso
    if (decodeResponse.containsKey('idToken')) {
      return null; // El login fue exitoso, retorna null
    } else {
      return decodeResponse['error']
          ['message']; // Retorna el mensaje de error si falla
    }
  }

  // Método para registrar un nuevo usuario con email y contraseña
  Future<String?> create_user(String email, String password) async {
    // Datos de registro que se envían en la solicitud
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    // Construcción de la URL de Firebase para registrar al usuario
    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    if (kDebugMode) {
      print(authData);
    } // Imprime los datos de registro para verificar

    // Realiza la solicitud POST a Firebase para registrar al usuario
    final response = await http.post(url, body: json.encode(authData));

    // Decodifica la respuesta en formato JSON
    final Map<String, dynamic> decodeResponse = json.decode(response.body);

    // Si la respuesta contiene un 'idToken', el registro fue exitoso
    if (decodeResponse.containsKey('idToken')) {
      return null; // El registro fue exitoso, retorna null
    } else {
      return decodeResponse['error']
          ['message']; // Retorna el mensaje de error si falla
    }
  }
} // Fin clase AuthService
