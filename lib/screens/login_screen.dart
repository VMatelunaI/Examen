// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import 'package:firebase_auth/firebase_auth.dart'; // Importa FirebaseAuth para la autenticación

// Clase que representa la pantalla de inicio de sesión (login)
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() =>
      _LoginScreenState(); // Crea el estado para el login
} // Fin clase LoginScreen

// Estado de la pantalla de inicio de sesión
class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // Instancia de FirebaseAuth para la autenticación
  final TextEditingController _email_controller =
      TextEditingController(); // Controlador para el campo de email
  final TextEditingController _password_controller =
      TextEditingController(); // Controlador para el campo de contraseña

  // Método asíncrono que maneja el inicio de sesión
  Future<void> _login() async {
    try {
      // Inicia sesión con email y contraseña utilizando FirebaseAuth
      // Si el inicio de sesión es exitoso, navega a la pantalla de inicio
      Navigator.pushReplacementNamed(
          context, '/home'); // Navegación a la pantalla principal
    } catch (e) {
      // Si ocurre un error, lo imprime en la consola
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'), // Título del AppBar
      ),
      // Cuerpo de la pantalla que contiene el formulario de login
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Margen alrededor del formulario
        child: Column(
          children: <Widget>[
            // Campo de texto para ingresar el email
            TextField(
              controller: _email_controller, // Asocia el controlador de email
              decoration: const InputDecoration(
                  labelText: 'Email'), // Etiqueta del campo de email
            ),
            // Campo de texto para ingresar la contraseña
            TextField(
              controller:
                  _password_controller, // Asocia el controlador de contraseña
              decoration: const InputDecoration(
                  labelText: 'Password'), // Etiqueta del campo de contraseña
              obscureText: true, // Oculta el texto (para contraseñas)
            ),
            // Botón que dispara la acción de iniciar sesión
            ElevatedButton(
              onPressed:
                  _login, // Llama al método _login cuando se presiona el botón
              child: const Text('Login'), // Texto del botón
            ),
          ],
        ),
      ),
    ); // Fin Scaffold
  }
} // Fin clase _LoginScreenState
