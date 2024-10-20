// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'dart:convert'; // Importa la biblioteca para manejar la codificación y decodificación de JSON

// Clase Category que representa una lista de categorías
class Category {
  // Constructor que recibe una lista de objetos Listadocat
  Category({
    required this.listadocat, // La lista de categorías (Listadocat) es requerida
  });

  // Atributo que contiene la lista de categorías
  List<Listadocat> listadocat;

  // Método de fábrica para crear un objeto Category desde una cadena JSON
  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  // Convierte el objeto Category a una cadena JSON
  String toJson() => json.encode(toMap());

  // Método de fábrica para crear un objeto Category desde un mapa (Map)
  factory Category.fromMap(Map<String, dynamic> json) => Category(
        // Convierte la lista de mapas dentro del JSON en una lista de objetos Listadocat
        listadocat: List<Listadocat>.from(
            json["Listado Categorias"].map((x) => Listadocat.fromMap(x))),
      );

  // Convierte el objeto Category a un mapa (Map) para su serialización a JSON
  Map<String, dynamic> toMap() => {
        // Serializa cada objeto Listadocat en un mapa
        "Listado Categorias":
            List<dynamic>.from(listadocat.map((x) => x.toMap())),
      };
}

// Clase Listadocat que representa una categoría individual
class Listadocat {
  int categoryId; // ID de la categoría
  String categoryName; // Nombre de la categoría
  String
      categoryState; // Estado de la categoría (por ejemplo, "Activa" o "Inactiva")

  // Constructor que requiere el ID, nombre y estado de la categoría
  Listadocat({
    required this.categoryId,
    required this.categoryName,
    required this.categoryState,
  });

  // Método de fábrica para crear un objeto Listadocat desde una cadena JSON
  factory Listadocat.fromJson(String str) =>
      Listadocat.fromMap(json.decode(str));

  // Convierte el objeto Listadocat a una cadena JSON
  String toJson() => json.encode(toMap());

  // Método de fábrica para crear un objeto Listadocat desde un mapa (Map)
  factory Listadocat.fromMap(Map<String, dynamic> json) => Listadocat(
        categoryId:
            json["category_id"], // Asigna el ID de la categoría desde el JSON
        categoryName: json["category_name"], // Asigna el nombre de la categoría
        categoryState:
            json["category_state"], // Asigna el estado de la categoría
      );

  // Convierte el objeto Listadocat a un mapa (Map) para su serialización a JSON
  Map<String, dynamic> toMap() => {
        "category_id": categoryId, // Serializa el ID de la categoría
        "category_name": categoryName, // Serializa el nombre de la categoría
        "category_state": categoryState, // Serializa el estado de la categoría
      };

  // Método para copiar un objeto Listadocat y devolver una nueva instancia con los mismos valores
  Listadocat copy() => Listadocat(
      categoryId: categoryId,
      categoryName: categoryName,
      categoryState: categoryState);
}
