// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import 'dart:convert'; // Importa la librería para trabajar con JSON y codificación
import 'package:http/http.dart'
    as http; // Importa la librería HTTP para realizar peticiones
import '/models/productos.dart'; // Importa el modelo de productos

// Servicio para manejar las operaciones de productos (cargar, editar, crear, eliminar)
class ProductService extends ChangeNotifier {
  // Configuración de la API y credenciales
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  // Listado de productos y producto seleccionado
  List<Listado> products = [];
  Listado? SelectProduct;

  // Estado de carga y edición/creación
  bool isLoading = true;
  bool isEditCreate = true;

  // Constructor que carga los productos al inicializar el servicio
  ProductService() {
    loadProducts(); // Carga los productos al inicializar
  }

  // Método para cargar los productos desde la API
  Future loadProducts() async {
    isLoading = true; // Activa el estado de carga
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado

    // Construcción de la URL de la API
    final url = Uri.http(
      _baseUrl,
      'ejemplos/product_list_rest/',
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud GET a la API
    final response = await http.get(url, headers: {'authorization': basicAuth});

    // Mapea la respuesta JSON a objetos de producto
    final productsMap = Product.fromJson(response.body);
    if (kDebugMode) {
      print(response.body);
    } // Imprime la respuesta para depuración

    // Asigna los productos obtenidos
    products = productsMap.listado;
    isLoading = false; // Desactiva el estado de carga
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado
  }

  // Método para editar o crear un producto
  Future editOrCreateProduct(Listado product) async {
    isEditCreate = true; // Activa el estado de edición/creación
    notifyListeners(); // Notifica a los oyentes

    // Si el ID del producto es 0, se crea un nuevo producto, de lo contrario, se edita
    if (product.productId == 0) {
      await createProduct(product); // Crea un nuevo producto
    } else {
      await updateProduct(product); // Actualiza el producto existente
    }

    isEditCreate = false; // Desactiva el estado de edición/creación
    notifyListeners(); // Notifica a los oyentes
  }

  // Método para actualizar un producto existente
  Future<String> updateProduct(Listado product) async {
    // Construcción de la URL de la API para editar productos
    final url = Uri.http(
      _baseUrl,
      'ejemplos/product_edit_rest/',
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud POST a la API para actualizar el producto
    final response = await http.post(url, body: product.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });

    final decodeResp = response.body;
    if (kDebugMode) {
      print(decodeResp);
    } // Imprime la respuesta para depuración

    // Actualiza el producto en la lista local
    final index = products
        .indexWhere((element) => element.productId == product.productId);
    products[index] = product;

    return ''; // Retorna vacío al finalizar
  }

  // Método para crear un nuevo producto
  Future createProduct(Listado product) async {
    // Construcción de la URL de la API para crear productos
    final url = Uri.http(
      _baseUrl,
      'ejemplos/product_add_rest/',
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud POST a la API para crear el producto
    final response = await http.post(url, body: product.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });

    final decodeResp = response.body;
    if (kDebugMode) {
      print(decodeResp);
    } // Imprime la respuesta para depuración

    // Agrega el nuevo producto a la lista local
    products.add(product);

    return ''; // Retorna vacío al finalizar
  }

  // Método para eliminar un producto
  Future deleteProduct(Listado product, BuildContext context) async {
    // Construcción de la URL de la API para eliminar productos
    final url = Uri.http(
      _baseUrl,
      'ejemplos/product_del_rest/',
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud POST a la API para eliminar el producto
    final response = await http.post(url, body: product.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });

    final decodeResp = response.body;
    if (kDebugMode) {
      print(decodeResp);
    } // Imprime la respuesta para depuración

    // Borra todo el listado local y recarga los productos
    this.products.clear();
    loadProducts();

    // Redirige a la lista de productos después de eliminar
    Navigator.of(context).pushNamed('list'); //MaterialPageRoute

    return ''; // Retorna vacío al finalizar
  }

  // Método para gestionar la compra de un producto (carrito de compras)
  Future shopProduct(Listado product, BuildContext context) async {
    // Construcción de la URL de la API para gestionar la compra
    final url = Uri.http(
      _baseUrl,
      'ejemplos/product_shop_rest/', // No tengo información del API para el carrito
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud POST a la API para gestionar la compra
    final response = await http.post(url, body: product.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });

    final decodeResp = response.body;
    if (kDebugMode) {
      print(decodeResp);
    } // Imprime la respuesta para depuración

    // Borra todo el listado local y recarga los productos
    products.clear();
    loadProducts();

    // Redirige a la lista de productos después de realizar la compra
    Navigator.of(context).pushNamed('list'); //MaterialPageRoute

    return ''; // Retorna vacío al finalizar
  }
} // Fin clase ProductService
