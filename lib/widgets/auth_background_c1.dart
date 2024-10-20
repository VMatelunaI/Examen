// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'dart:math'; // Importa la librería para generar números aleatorios
import 'package:flutter/material.dart'; // Importa los componentes de Flutter

// Clase para crear el fondo dinámico con burbujas y un degradado naranja
class AuthBackgorundC1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Random rnd = new Random(); // Generador de números aleatorios

    // Obtiene el tamaño de la pantalla del dispositivo
    final sizeScreen = MediaQuery.of(context).size; // Tamaño de la pantalla

    // Retorna un contenedor que abarca toda la pantalla con un fondo decorado y burbujas
    return Container(
      width: double.infinity, // Abarca todo el ancho de la pantalla
      height:
          sizeScreen.height * 0.98, // Abarca el 98% de la altura de la pantalla
      decoration:
          orangeDecoration(), // Aplicar decoración de color con degradado
      child: Stack(
        children: [
          // Burbujas posicionadas aleatoriamente
          Positioned(
            top: rnd.nextDouble() * 90.0, // Posición vertical aleatoria
            left: rnd.nextDouble() * 150.0, // Posición horizontal aleatoria
            child: Buble(),
          ),
          Positioned(
            top: -40 + rnd.nextDouble() * 60.0, // Posición vertical ajustada
            left: -30 + rnd.nextDouble() * 20.0, // Posición horizontal ajustada
            child: Buble(),
          ),
          Positioned(
            top: -50 + rnd.nextDouble() * 100.0, // Posición vertical ajustada
            right:
                -20 + rnd.nextDouble() * 50.0, // Posición ajustada a la derecha
            child: Buble(),
          ),
          Positioned(
            bottom: -50 + rnd.nextDouble() * 100.0, // Posición ajustada abajo
            left: -20 +
                rnd.nextDouble() * 50.0, // Posición ajustada a la izquierda
            child: Buble(),
          ),
          Positioned(
            bottom:
                rnd.nextDouble() * 150.0, // Posición vertical aleatoria abajo
            right: rnd.nextDouble() *
                50.0, // Posición horizontal aleatoria a la derecha
            child: Buble(),
          ),
          Positioned(
            bottom: rnd.nextDouble() * 50.0, // Posición vertical aleatoria
            right: rnd.nextDouble() * 200.0, // Posición horizontal aleatoria
            child: Buble(),
          ),
        ],
      ),
    ); // Fin Container
  }

  // Método que retorna la decoración con un degradado de tonos naranja-amarillo
  BoxDecoration orangeDecoration() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(255, 185, 0, 1), // Color naranja oscuro
        Color.fromRGBO(255, 200, 2, 1), // Color amarillo
      ]));
} // Fin clase AuthBackgorundC1

// Clase para crear una burbuja aleatoria en el fondo
class Buble extends StatelessWidget {
  @override
  Random rnd = new Random(); // Generador de números aleatorios

  // Método que construye cada burbuja
  Widget build(BuildContext context) {
    return Container(
      width: rnd.nextDouble() * 250.0, // Ancho aleatorio
      height: rnd.nextDouble() * 250.0, // Altura aleatoria
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(100), // Bordes redondeados (burbuja)
        color: Color.fromRGBO(rnd.nextInt(255), rnd.nextInt(255),
            rnd.nextInt(255), 0.50), // Color aleatorio con opacidad del 50%
      ),
    ); // Fin Container
  }
} // Fin clase Buble
