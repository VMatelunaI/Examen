// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/widgets/widgets.dart'; // Importa los widgets personalizados

// Clase Background que envuelve el fondo con el contenido de la pantalla
class Background extends StatelessWidget {
  // Widget hijo que será colocado sobre el fondo dinámico
  final Widget child;

  // Constructor que recibe el widget hijo
  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Retorna un contenedor que abarca toda la pantalla
    return Container(
      color: Colors.blue[100], // Fondo con color azul claro
      width: double.infinity, // Ancho completo de la pantalla
      height: double.infinity, // Altura completa de la pantalla
      child: Stack(
        children: [
          // Inserta el fondo dinámico con burbujas
          AuthBackgorundC1(),

          // Área segura para colocar el contenido
          SafeArea(
            child: Container(
              width: double.infinity, // Ancho completo
              margin:
                  const EdgeInsets.only(top: 5), // Margen superior ajustado a 5
            ),
          ),

          // El widget hijo que se mostrará encima del fondo
          child,
        ],
      ),
    ); // Fin Container
  }
} // Fin clase Background
