// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/models/proveedores.dart'; // Importa el modelo de proveedores

// Clase ProveedorFormProvider que gestiona el formulario de proveedores
class ProveedorFormProvider extends ChangeNotifier {
  // Llave global que permite acceder al estado del formulario
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  // Objeto de tipo Listadop que representa un proveedor
  Listadop proveedor;

  // Constructor que inicializa el proveedor con un objeto de tipo Listadop
  ProveedorFormProvider(this.proveedor);

  // Método que valida el formulario y retorna true si es válido, false si no lo es
  bool isValidForm() {
    return formKey.currentState?.validate() ??
        false; // Valida el formulario si no es nulo
  }
} // Fin clase ProveedorFormProvider
