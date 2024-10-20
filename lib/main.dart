// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart';
// Importación de rutas personalizadas
import '/routes/app_routes.dart';
// Importación de servicios de autenticación y manejo de datos
import '/services/auth_service.dart';
import '/services/product_service.dart';
import '/services/proveedor_service.dart';
import '/services/category_service.dart';
// Importación del tema personalizado de la aplicación
import '/theme/my_theme.dart';
// Paquete para la gestión del estado con Provider
import 'package:provider/provider.dart';

// Función principal que inicia la aplicación
void main() => runApp(const AppState());

// Clase que maneja el estado global de la aplicación con MultiProvider
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Proveedores de estado para servicios (autenticación, productos, proveedores, categorías)
        ChangeNotifierProvider(
            create: (_) => AuthService()), // Servicio de autenticación
        ChangeNotifierProvider(
            create: (_) => ProductService()), // Servicio de productos
        ChangeNotifierProvider(
            create: (_) => ProveedorService()), // Servicio de proveedores
        ChangeNotifierProvider(
            create: (_) => CategoryService()), // Servicio de categorías
      ],
      // El hijo de MultiProvider es la aplicación principal
      child: const MainApp(),
    );
  }
}

// Clase principal que define la estructura básica de la aplicación
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Elimina el banner de "debug" en la esquina superior derecha
      debugShowCheckedModeBanner: false,
      // Título de la aplicación
      title: 'Material App',
      // Ruta inicial que se cargará al iniciar la app
      initialRoute: AppRoutes.initialRoute,
      // Definición de las rutas de la aplicación
      routes: AppRoutes.routes,
      // Método que genera rutas de manera dinámica
      onGenerateRoute: AppRoutes.onGenerateRoute,
      // Aplicación de un tema personalizado
      theme: MyTheme.myTheme,
    );
  }
}
