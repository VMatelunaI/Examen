// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter

// Clase que crea el fondo dinámico con burbujas y un degradado en tonos naranja
class AuthBackgorundC1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla del dispositivo
    final sizeScreen = MediaQuery.of(context).size; // Tamaño de la pantalla

    // Retorna un contenedor que abarca el 40% de la pantalla con un fondo decorado
    return Container(
      width: double.infinity, // Abarca todo el ancho de la pantalla
      height:
          sizeScreen.height * 0.4, // Abarca el 40% de la altura de la pantalla
      decoration:
          orangeDecoration(), // Aplicar decoración de color con degradado
      child: Stack(
        children: [
          // Posiciona las burbujas en lugares estratégicos de la pantalla
          Positioned(
            top: 90,
            left: 30,
            child: Buble(),
          ),
          Positioned(
            top: -40,
            left: -30,
            child: Buble(),
          ),
          Positioned(
            top: -50,
            right: -20,
            child: Buble(),
          ),
          Positioned(
            bottom: -50,
            left: -20,
            child: Buble(),
          ),
          Positioned(
            bottom: 120,
            right: 20,
            child: Buble(),
          ),
          Positioned(
            bottom: 20,
            right: 80,
            child: Buble(),
          ),
        ],
      ),
    ); // Fin Container
  }

  // Método que retorna la decoración con un degradado de tonos naranja
  BoxDecoration orangeDecoration() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(255, 165, 0, 1), // Color naranja brillante
        Color.fromRGBO(255, 100, 2, 1), // Color naranja oscuro
      ]));
} // Fin clase AuthBackgorundC1

// Clase que crea una burbuja con tamaño y color específico
class Buble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retorna un contenedor circular (burbuja) con tamaño fijo y opacidad baja
    return Container(
      width: 100, // Ancho de la burbuja
      height: 100, // Altura de la burbuja
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(100), // Bordes redondeados (burbuja)
        color: const Color.fromRGBO(
            255, 255, 255, 0.15), // Color blanco con opacidad del 15%
      ),
    ); // Fin Container
  }
} // Fin clase Buble
