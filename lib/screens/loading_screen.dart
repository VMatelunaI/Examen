// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter

// Pantalla que se muestra durante la carga de datos o procesos
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar con el título "LoadingScreen"
      appBar: AppBar(
        title: const Text('Cargando Pantalla'), // Título del AppBar
      ),
      // Cuerpo de la pantalla con un mensaje centrado
      body: const Center(
        child: Text(
            'Cargando Pantalla'), // Texto que indica que se está cargando la pantalla
      ),
    ); // Fin Scaffold
  }
} // Fin clase LoadingScreen
