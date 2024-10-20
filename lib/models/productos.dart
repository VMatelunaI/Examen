// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'dart:convert'; // Importa la biblioteca para manejar la codificación y decodificación de JSON

// Clase Product que representa una lista de productos
class Product {
  // Constructor de la clase Product, que requiere una lista de objetos Listado
  Product({
    required this.listado,
  });

  // Atributo que contiene una lista de productos (Listado)
  List<Listado> listado;

  // Método de fábrica para crear un objeto Product desde una cadena JSON
  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  // Convierte el objeto Product a una cadena JSON
  String toJson() => json.encode(toMap());

  // Método de fábrica para crear un objeto Product desde un mapa (Map)
  factory Product.fromMap(Map<String, dynamic> json) => Product(
        // Convierte la lista de mapas dentro del JSON en una lista de objetos Listado
        listado:
            List<Listado>.from(json["Listado"].map((x) => Listado.fromMap(x))),
      );

  // Convierte el objeto Product a un mapa (Map) para su serialización a JSON
  Map<String, dynamic> toMap() => {
        // Serializa cada objeto Listado en un mapa
        "Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

// Clase Listado que representa un producto individual
class Listado {
  // Constructor de la clase Listado, con atributos requeridos
  Listado({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productState,
  });

  // Atributos del producto
  int productId; // ID del producto
  String productName; // Nombre del producto
  int productPrice; // Precio del producto
  String productImage; // URL de la imagen del producto
  String productState; // Estado del producto (ej. "Activo" o "Inactivo")

  // Método de fábrica para crear un objeto Listado desde una cadena JSON
  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  // Convierte el objeto Listado a una cadena JSON
  String toJson() => json.encode(toMap());

  // Método de fábrica para crear un objeto Listado desde un mapa (Map)
  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
        productId:
            json["product_id"], // Asigna el ID del producto desde el JSON
        productName: json["product_name"], // Asigna el nombre del producto
        productPrice: json["product_price"], // Asigna el precio del producto
        productImage:
            json["product_image"], // Asigna la URL de la imagen del producto
        productState: json["product_state"], // Asigna el estado del producto
      );

  // Convierte el objeto Listado a un mapa (Map) para serialización a JSON
  Map<String, dynamic> toMap() => {
        "product_id": productId, // Serializa el ID del producto
        "product_name": productName, // Serializa el nombre del producto
        "product_price": productPrice, // Serializa el precio del producto
        "product_image": productImage, // Serializa la URL de la imagen
        "product_state": productState, // Serializa el estado del producto
      };

  // Método para copiar un objeto Listado y devolver una nueva instancia con los mismos valores
  Listado copy() => Listado(
      productId: productId,
      productName: productName,
      productPrice: productPrice,
      productImage: productImage,
      productState: productState);
}
