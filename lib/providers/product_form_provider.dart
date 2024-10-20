// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/models/productos.dart'; // Importa el modelo de productos

// Clase ProductFormProvider que gestiona el formulario de productos
class ProductFormProvider extends ChangeNotifier {
  // Llave global que permite acceder al estado del formulario
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  // Objeto de tipo Listado que representa un producto
  Listado product;

  // Constructor que inicializa el proveedor con un producto
  ProductFormProvider(this.product);

  // Método que valida el formulario y retorna true si es válido, false si no lo es
  bool isValidForm() {
    return formKey.currentState?.validate() ??
        false; // Valida el formulario si no es nulo
  }
} // Fin clase ProductFormProvider
