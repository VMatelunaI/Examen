// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'dart:convert'; // Importa la biblioteca para manejar la codificación y decodificación de JSON

// Clase Proveedor que representa una lista de proveedores
class Proveedor {
  // Constructor que requiere una lista de objetos Listadop (proveedores)
  Proveedor({
    required this.listado, // Lista de proveedores es requerida
  });

  // Atributo que contiene la lista de proveedores
  List<Listadop> listado;

  // Método de fábrica para crear un objeto Proveedor desde una cadena JSON
  factory Proveedor.fromJson(String str) => Proveedor.fromMap(json.decode(str));

  // Convierte el objeto Proveedor a una cadena JSON
  String toJson() => json.encode(toMap());

  // Método de fábrica para crear un objeto Proveedor desde un mapa (Map)
  factory Proveedor.fromMap(Map<String, dynamic> json) => Proveedor(
        // Convierte la lista de mapas dentro del JSON en una lista de objetos Listadop (proveedores)
        listado: List<Listadop>.from(
            json["Proveedores Listado"].map((x) => Listadop.fromMap(x))),
      );

  // Convierte el objeto Proveedor a un mapa (Map) para su serialización a JSON
  Map<String, dynamic> toMap() => {
        // Serializa cada objeto Listadop (proveedor) en un mapa
        "Proveedores Listado":
            List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

// Clase Listadop que representa un proveedor individual
class Listadop {
  // Constructor que requiere el ID, nombre, apellido, correo electrónico y estado del proveedor
  Listadop({
    required this.proveedorId,
    required this.proveedorName,
    required this.proveedorLastName,
    required this.proveedorEmail,
    required this.proveedorState,
  });

  // Atributos del proveedor
  int proveedorId; // ID del proveedor
  String proveedorName; // Nombre del proveedor
  String proveedorLastName; // Apellido del proveedor
  String proveedorEmail; // Correo electrónico del proveedor
  String proveedorState; // Estado del proveedor (ej. "Activo" o "Inactivo")

  // Método de fábrica para crear un objeto Listadop desde una cadena JSON
  factory Listadop.fromJson(String str) => Listadop.fromMap(json.decode(str));

  // Convierte el objeto Listadop a una cadena JSON
  String toJson() => json.encode(toMap());

  // Método de fábrica para crear un objeto Listadop desde un mapa (Map)
  factory Listadop.fromMap(Map<String, dynamic> json) => Listadop(
        proveedorId:
            json["providerid"], // Asigna el ID del proveedor desde el JSON
        proveedorName: json["provider_name"], // Asigna el nombre del proveedor
        proveedorLastName:
            json["provider_last_name"], // Asigna el apellido del proveedor
        proveedorEmail:
            json["provider_mail"], // Asigna el correo electrónico del proveedor
        proveedorState:
            json["provider_state"], // Asigna el estado del proveedor
      );

  // Convierte el objeto Listadop a un mapa (Map) para su serialización a JSON
  Map<String, dynamic> toMap() => {
        "providerid": proveedorId, // Serializa el ID del proveedor
        "provider_name": proveedorName, // Serializa el nombre del proveedor
        "provider_last_name":
            proveedorLastName, // Serializa el apellido del proveedor
        "provider_mail":
            proveedorEmail, // Serializa el correo electrónico del proveedor
        "provider_state": proveedorState, // Serializa el estado del proveedor
      };

  // Método para copiar un objeto Listadop y devolver una nueva instancia con los mismos valores
  Listadop copy() => Listadop(
      proveedorId: proveedorId,
      proveedorName: proveedorName,
      proveedorLastName: proveedorLastName,
      proveedorEmail: proveedorEmail,
      proveedorState: proveedorState);
}
