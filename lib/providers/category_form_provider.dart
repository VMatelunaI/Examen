// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart';
import '/models/categorias.dart'; // Importa el modelo de categorías

// Clase que gestiona el formulario para las categorías y notifica los cambios
class CategoryFormProvider extends ChangeNotifier {
  // Llave global que permite acceder al estado del formulario
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  // Objeto de tipo Listadocat (categoría) que se está manipulando
  Listadocat category;

  // Constructor que recibe un objeto de tipo Listadocat (categoría)
  CategoryFormProvider(this.category);

  // Método que valida el formulario y retorna si es válido o no
  bool isValidForm() {
    return formKey.currentState?.validate() ??
        false; // Si el formulario no es nulo, valida, de lo contrario retorna false
  }
} // Fin clase CategoryFormProvider
