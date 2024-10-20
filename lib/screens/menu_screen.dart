// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import '/widgets/background.dart'; // Importa el widget de fondo personalizado
import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/widgets/widgets.dart'; // Importa los widgets personalizados
import 'package:provider/provider.dart'; // Importa Provider para la gestión del estado
import '/providers/providers.dart'; // Importa los proveedores de estado

// Pantalla principal del menú
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usa el widget de fondo personalizado
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 250, // Espacio en blanco antes de la tarjeta
              ),
              // Contenedor tipo tarjeta para el contenido del menú
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 30), // Espacio entre los elementos
                    Text(
                      'Menu - Menu', // Título de la pantalla
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall, // Aplica el tema de texto
                    ),
                    const SizedBox(height: 40), // Espacio antes de los botones
                    // Proveedor del formulario del menú
                    ChangeNotifierProvider(
                      create: (_) => MenuFormProvider(),
                      child: const MenuForm(), // Formulario del menú
                    ),
                    const SizedBox(height: 50), // Espaciado adicional
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ); // Fin Scaffold
  }
} // Fin clase MenuScreen

// Clase que representa el formulario del menú
class MenuForm extends StatelessWidget {
  const MenuForm({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuForm = Provider.of<MenuFormProvider>(
        context); // Accede al estado del formulario del menú

    return Container(
      child: Form(
        key: MenuForm.formKey, // Llave del formulario para validaciones
        autovalidateMode: AutovalidateMode
            .onUserInteraction, // Valida mientras el usuario interactúa
        child: Column(
          children: [
            // Botón para ir a la lista de proveedores
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
              ),
              disabledColor:
                  Colors.grey, // Color cuando el botón está deshabilitado
              color: Colors.blue, // Color del botón
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 80, vertical: 10), // Tamaño del botón
                child: const Text(
                  '*Proveedores*',
                  style: TextStyle(color: Colors.white), // Color del texto
                ),
              ),
              elevation: 0,
              onPressed: MenuForm.isLoading
                  ? null // Si está cargando, el botón está deshabilitado
                  : () async {
                      FocusScope.of(context)
                          .unfocus(); // Cierra el teclado si está abierto
                      MenuForm.isLoading = true; // Activa el estado de carga
                      Navigator.pushNamed(context,
                          'listprov'); // Navega a la pantalla de proveedores
                      MenuForm.isLoading =
                          false; // Desactiva el estado de carga
                    },
            ),
            // Botón para ir a la lista de categorías
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
              ),
              disabledColor:
                  Colors.grey, // Color cuando el botón está deshabilitado
              color: Colors.blue, // Color del botón
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 80, vertical: 10), // Tamaño del botón
                child: const Text(
                  '*Categorias*',
                  style: TextStyle(color: Colors.white), // Color del texto
                ),
              ),
              elevation: 0,
              onPressed: MenuForm.isLoading
                  ? null // Si está cargando, el botón está deshabilitado
                  : () async {
                      FocusScope.of(context)
                          .unfocus(); // Cierra el teclado si está abierto
                      MenuForm.isLoading = true; // Activa el estado de carga
                      Navigator.pushNamed(context,
                          'listcat'); // Navega a la pantalla de categorías
                      MenuForm.isLoading =
                          false; // Desactiva el estado de carga
                    },
            ),
            // Botón para ir a la lista de productos
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
              ),
              disabledColor:
                  Colors.grey, // Color cuando el botón está deshabilitado
              color: Colors.blue, // Color del botón
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 80, vertical: 10), // Tamaño del botón
                child: const Text(
                  '*Productos*',
                  style: TextStyle(color: Colors.white), // Color del texto
                ),
              ),
              elevation: 0,
              onPressed: MenuForm.isLoading
                  ? null // Si está cargando, el botón está deshabilitado
                  : () async {
                      FocusScope.of(context)
                          .unfocus(); // Cierra el teclado si está abierto
                      MenuForm.isLoading = true; // Activa el estado de carga
                      Navigator.pushNamed(context,
                          'listprod'); // Navega a la pantalla de productos
                      MenuForm.isLoading =
                          false; // Desactiva el estado de carga
                    },
            ),
          ],
        ),
      ),
    ); // Fin Container
  }
} // Fin clase MenuForm
