// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart';

// Clase que centraliza las decoraciones de campos de texto (inputs)
class InputDecortions {
  // Método estático para definir la decoración de los inputs de autenticación
  static InputDecoration authInputDecoration({
    required String
        hinText, // Texto que se mostrará como pista en el campo de texto (hint)
    required String
        labelText, // Texto de la etiqueta que describe el campo (label)
    IconData?
        prefixIcon, // Icono que se muestra antes del texto en el campo (opcional)
  }) {
    // Retorna un objeto de tipo InputDecoration que define el estilo del input
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            // Borde del input cuando no está enfocado
            borderSide: BorderSide(
          color: Colors.blue, // Color del borde cuando el input está habilitado
        )),
        focusedBorder: const UnderlineInputBorder(
            // Borde del input cuando está enfocado
            borderSide: BorderSide(
          color: Colors.blue, // Color del borde cuando el input está enfocado
          width: 3, // Grosor del borde cuando el input está enfocado
        )),
        hintText:
            hinText, // Texto de pista que aparece dentro del campo cuando está vacío
        labelText:
            labelText, // Texto de la etiqueta que aparece encima del campo de texto
        labelStyle: const TextStyle(
            color: Colors.grey), // Estilo de la etiqueta (color gris)
        // Si se pasa un icono, lo agrega al campo de texto
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon, // Icono que se muestra antes del texto
                color: Colors.blue, // Color del icono
              )
            : null); // Si no se proporciona un icono, se omite
  }
}
