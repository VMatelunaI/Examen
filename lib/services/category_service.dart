// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:examen_app_movil/models/categorias.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import 'dart:convert'; // Importa la librería para trabajar con JSON y codificación
import 'package:http/http.dart'
    as http; // Importa la librería HTTP para realizar peticiones
import '/models/categorias.dart'
    as model; // Importa el modelo de categorías con alias

// Servicio para manejar las operaciones de categorías (cargar, editar, crear, eliminar)
class CategoryService extends ChangeNotifier {
  // Configuración de la API y credenciales
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  // Listado de categorías y categoría seleccionada
  List<Listadocat> categorys = [];
  Listadocat? SelectCategory;

  // Estado de carga y edición/creación
  bool isLoading = true;
  bool isEditCreate = true;

  // Constructor que carga las categorías al inicializar el servicio
  CategoryService() {
    loadCategorys(); // Carga las categorías al inicializar
  }

  // Método para cargar las categorías desde la API
  Future loadCategorys() async {
    isLoading = true; // Activa el estado de carga
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado

    // Construcción de la URL de la API
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_list_rest/',
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud GET a la API
    final response = await http.get(url, headers: {'authorization': basicAuth});

    // Mapea la respuesta JSON a objetos de categoría
    final categorysMap = model.Category.fromJson(response.body);
    if (kDebugMode) {
      print(response.body);
    } // Imprime la respuesta para depuración

    // Asigna las categorías obtenidas
    categorys = categorysMap.listadocat;
    isLoading = false; // Desactiva el estado de carga
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado
  }

  // Método para editar o crear una categoría
  Future editOrCreateCategory(Listadocat category) async {
    isEditCreate = true; // Activa el estado de edición/creación
    notifyListeners(); // Notifica a los oyentes

    // Si el ID de la categoría es 0, se crea una nueva, de lo contrario, se edita
    if (category.categoryId == 0) {
      await createCategory(category); // Crea una nueva categoría
    } else {
      await updateCategory(category); // Actualiza la categoría existente
    }

    isEditCreate = false; // Desactiva el estado de edición/creación
    notifyListeners(); // Notifica a los oyentes
  }

  // Método para actualizar una categoría existente
  Future<String> updateCategory(Listadocat category) async {
    // Construcción de la URL de la API para editar categorías
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_edit_rest/',
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud POST a la API para actualizar la categoría
    final response = await http.post(url, body: category.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });

    final decodeResp = response.body;
    if (kDebugMode) {
      print(decodeResp);
    } // Imprime la respuesta para depuración

    // Actualiza la categoría en la lista local
    final index = categorys
        .indexWhere((element) => element.categoryId == category.categoryId);
    categorys[index] = category;

    return ''; // Retorna vacío al finalizar
  }

  // Método para crear una nueva categoría
  Future createCategory(Listadocat category) async {
    // Construcción de la URL de la API para crear categorías
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_add_rest/',
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud POST a la API para crear la categoría
    final response = await http.post(url, body: category.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });

    final decodeResp = response.body;
    if (kDebugMode) {
      print(decodeResp);
    } // Imprime la respuesta para depuración

    // Agrega la nueva categoría a la lista local
    this.categorys.add(category);

    return ''; // Retorna vacío al finalizar
  }

  // Método para eliminar una categoría
  Future deleteCategory(Listadocat category, BuildContext context) async {
    // Construcción de la URL de la API para eliminar categorías
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_del_rest/',
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud POST a la API para eliminar la categoría
    final response = await http.post(url, body: category.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });

    final decodeResp = response.body;
    if (kDebugMode) {
      print(decodeResp);
    } // Imprime la respuesta para depuración

    // Borra todo el listado local y recarga las categorías
    categorys.clear();
    loadCategorys();

    // Redirige a la lista de categorías después de eliminar
    Navigator.of(context).pushNamed('listcat'); //MaterialPageRoute

    return ''; // Retorna vacío al finalizar
  }
} // Fin clase CategoryService
