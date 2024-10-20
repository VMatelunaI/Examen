// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter

// Clase que representa la pantalla de error
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior (AppBar) con el título 'ErrorScreen'
      appBar: AppBar(
        title: const Text('ErrorScreen'), // Título del AppBar
      ),
      // Cuerpo de la pantalla con un mensaje centrado
      body: const Center(
        child: Text('ErrorScreen'), // Mensaje de error mostrado en el centro
      ),
    );
  }
} // Fin clase ErrorScreen
