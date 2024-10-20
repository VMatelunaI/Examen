// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter

// Clase que crea un contenedor con estilo de tarjeta redondeada
class CardContainer extends StatelessWidget {
  // Widget hijo que será contenido dentro de la tarjeta
  final Widget child;

  // Constructor que recibe el widget hijo
  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Retorna un padding envolviendo el contenedor para darle espacio en los lados
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30), // Espacio lateral
      child: Container(
        width: double.infinity, // Abarca todo el ancho disponible
        padding:
            const EdgeInsets.all(20), // Padding interno dentro de la tarjeta
        decoration: cardDecoration(), // Aplica la decoración de la tarjeta
        child: child, // El widget hijo se coloca dentro de la tarjeta
      ),
    ); // Fin Padding
  }
} // Fin clase CardContainer

// Método que retorna la decoración personalizada para la tarjeta
BoxDecoration cardDecoration() => BoxDecoration(
      color: Colors.white, // Fondo blanco para la tarjeta
      borderRadius: BorderRadius.circular(95), // Bordes redondeados grandes
      boxShadow: const [
        // Sombra debajo de la tarjeta para darle un efecto de elevación
        BoxShadow(
          color: Colors.black, // Color de la sombra
          blurRadius: 15, // Desenfoque de la sombra
          offset: Offset(0, 5), // Desplazamiento de la sombra
        ),
      ],
    ); // Fin BoxDecoration
