// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart';

// Clase que define el tema personalizado de la aplicación
class MyTheme {
  // Color primario utilizado en toda la aplicación (azul personalizado)
  static const Color primary = Color.fromRGBO(0, 110, 255, 1);

  // Definición del tema personalizado utilizando ThemeData
  static final ThemeData myTheme = ThemeData(
      primaryColor:
          primary, // Define el color primario utilizado en los widgets
      brightness:
          Brightness.light, // Establece el tema en modo claro (light mode)
      fontFamily: 'Releway', // Fuente personalizada que se usará en toda la app
      appBarTheme: const AppBarTheme(
        // Configuración personalizada para las AppBars (barras de navegación)
        color: primary, // Color de fondo de la AppBar
        elevation: 10, // Sombra debajo de la AppBar
      ),
      textButtonTheme: TextButtonThemeData(
          // Configuración para los botones de tipo TextButton
          style: TextButton.styleFrom(
              foregroundColor: primary)), // Color del texto de los botones
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor:
              primary)); // Color de fondo para los FloatingActionButton
}
