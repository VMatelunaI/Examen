// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/widgets/widgets.dart'; // Importa los widgets personalizados

// Clase AuthBackground que envuelve el fondo con el contenido de autenticación
class AuthBackground extends StatelessWidget {
  // Widget hijo que será colocado sobre el fondo de autenticación
  final Widget child;

  // Constructor que recibe el widget hijo
  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Retorna un contenedor que envuelve toda la pantalla
    return Container(
      color: Colors.blue[100], // Fondo con color azul claro
      width: double.infinity, // Ancho completo de la pantalla
      height: double.infinity, // Altura completa de la pantalla
      child: Stack(
        children: [
          // Inserta el fondo dinámico con burbujas
          AuthBackgorundC1(),

          // Área segura que evita que el contenido quede debajo de las barras de notificaciones
          SafeArea(
            child: Container(
              width: double.infinity, // Ancho completo
              margin: const EdgeInsets.only(
                  top: 10), // Margen superior para el ícono
              child: const Icon(
                Icons.person_pin_circle_rounded, // Ícono de persona circular
                color: Colors.white, // Color blanco para el ícono
                size: 100, // Tamaño del ícono
              ),
            ),
          ),

          // El widget hijo que se mostrará encima del fondo
          child,
        ],
      ),
    ); // Fin Container
  }
} // Fin clase AuthBackground
