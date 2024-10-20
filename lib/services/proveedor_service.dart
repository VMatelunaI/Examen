// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import 'dart:convert'; // Importa la librería para trabajar con JSON y codificación
import 'package:http/http.dart'
    as http; // Importa la librería HTTP para realizar peticiones
import '/models/proveedores.dart'; // Importa el modelo de proveedores

// Servicio para manejar las operaciones de proveedores (cargar, editar, crear, eliminar)
class ProveedorService extends ChangeNotifier {
  // Configuración de la API y credenciales
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  // Listado de proveedores y proveedor seleccionado
  List<Listadop> proveedores = [];
  Listadop? SelectProveedor;

  // Estado de carga y edición/creación
  bool isLoading = true;
  bool isEditCreate = true;

  // Constructor que carga los proveedores al inicializar el servicio
  ProveedorService() {
    loadProveedor(); // Carga los proveedores al inicializar
  }

  // Método para cargar los proveedores desde la API
  Future loadProveedor() async {
    isLoading = true; // Activa el estado de carga
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado

    // Construcción de la URL de la API
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_list_rest/',
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud GET a la API
    final response = await http.get(url, headers: {'authorization': basicAuth});

    // Mapea la respuesta JSON a objetos de proveedor
    final proveedoresMap = Proveedor.fromJson(response.body);
    if (kDebugMode) {
      print(response.body);
    } // Imprime la respuesta para depuración

    // Asigna los proveedores obtenidos
    proveedores = proveedoresMap.listado;
    isLoading = false; // Desactiva el estado de carga
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado
  }

  // Método para editar o crear un proveedor
  Future editOrCreateProveedor(Listadop proveedor) async {
    isEditCreate = true; // Activa el estado de edición/creación
    notifyListeners(); // Notifica a los oyentes

    // Si el ID del proveedor es 0, se crea un nuevo proveedor, de lo contrario, se edita
    if (proveedor.proveedorId == 0) {
      await createProveedor(proveedor); // Crea un nuevo proveedor
    } else {
      await updateProveedor(proveedor); // Actualiza el proveedor existente
    }

    isEditCreate = false; // Desactiva el estado de edición/creación
    notifyListeners(); // Notifica a los oyentes
  }

  // Método para actualizar un proveedor existente
  Future<String> updateProveedor(Listadop proveedor) async {
    // Construcción de la URL de la API para editar proveedores
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_edit_rest/',
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud POST a la API para actualizar el proveedor
    final response = await http.post(url, body: proveedor.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });

    final decodeResp = response.body;
    if (kDebugMode) {
      print(decodeResp);
    } // Imprime la respuesta para depuración

    // Actualiza el proveedor en la lista local
    final index = proveedores
        .indexWhere((element) => element.proveedorId == proveedor.proveedorId);
    proveedores[index] = proveedor;

    return ''; // Retorna vacío al finalizar
  }

  // Método para crear un nuevo proveedor
  Future createProveedor(Listadop proveedor) async {
    // Construcción de la URL de la API para crear proveedores
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_add_rest/',
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud POST a la API para crear el proveedor
    final response = await http.post(url, body: proveedor.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });

    final decodeResp = response.body;
    if (kDebugMode) {
      print(decodeResp);
    } // Imprime la respuesta para depuración

    // Agrega el nuevo proveedor a la lista local
    proveedores.add(proveedor);

    return ''; // Retorna vacío al finalizar
  }

  // Método para eliminar un proveedor
  Future deleteProveedor(Listadop proveedor, BuildContext context) async {
    // Construcción de la URL de la API para eliminar proveedores
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_del_rest/',
    );

    // Autenticación básica con base64
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    // Realiza la solicitud POST a la API para eliminar el proveedor
    final response = await http.post(url, body: proveedor.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });

    final decodeResp = response.body;
    if (kDebugMode) {
      print(decodeResp);
    } // Imprime la respuesta para depuración

    // Borra todo el listado local y recarga los proveedores
    proveedores.clear();
    loadProveedor();

    // Redirige a la lista de proveedores después de eliminar
    Navigator.of(context).pushNamed('listprov'); //MaterialPageRoute

    return ''; // Retorna vacío al finalizar
  }
} // Fin clase ProveedorService
