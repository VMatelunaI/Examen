// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import '/screens/menu_screen.dart'; // Importa la pantalla de menú
import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/screens/screen.dart'; // Importa las pantallas que se utilizan en las rutas

// Clase AppRoutes que define las rutas de la aplicación
class AppRoutes {
  // Ruta inicial de la aplicación
  static const initialRoute =
      'login'; // Establece 'login' como la ruta inicial (puede cambiarse a 'menu' si se requiere iniciar en el menú)

  // Mapa que define las rutas de la aplicación
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) =>
        LoginScreen(), // Ruta para la pantalla de login
    'listprod': (BuildContext context) =>
        const ListProductScreen(), // Ruta para la pantalla de listar productos
    'edit': (BuildContext context) =>
        const EditProductScreen(), // Ruta para la pantalla de editar producto
    'listprov': (BuildContext context) =>
        const ListProveedorScreen(), // Ruta para la pantalla de listar proveedores
    'editprov': (BuildContext context) =>
        const EditProveedorScreen(), // Ruta para la pantalla de editar proveedor
    'listcat': (BuildContext context) =>
        const ListCategoryScreen(), // Ruta para la pantalla de listar categorías
    'editcat': (BuildContext context) =>
        const EditCategoryScreen(), // Ruta para la pantalla de editar categoría
    'add_user': (BuildContext context) =>
        const RegisterUserScreen(), // Ruta para la pantalla de registro de usuario
    'menu': (BuildContext context) =>
        const MenuScreen(), // Ruta para la pantalla del menú principal
  };

  // Método que se ejecuta cuando se genera una ruta dinámica (no definida en el mapa de rutas)
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) =>
          const ErrorScreen(), // Pantalla de error si la ruta no es encontrada
    );
  }
} // Fin clase AppRoutes
