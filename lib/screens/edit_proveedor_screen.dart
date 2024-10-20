// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/providers/proveedor_form_provider.dart'; // Importa el proveedor del formulario de proveedor
import '/services/proveedor_service.dart'; // Importa el servicio de proveedores
import 'package:provider/provider.dart'; // Importa Provider para la gestión del estado
import '../ui/input_decorations.dart'; // Importa decoraciones de inputs

// Pantalla para editar un proveedor
class EditProveedorScreen extends StatelessWidget {
  const EditProveedorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final proveedorService = Provider.of<ProveedorService>(
        context); // Obtiene el servicio de proveedores
    return ChangeNotifierProvider(
      create: (_) => ProveedorFormProvider(proveedorService
          .SelectProveedor!), // Proveedor del formulario para el proveedor seleccionado
      child: _ProveedorScreenBody(proveedorService: proveedorService),
    );
  }
} // Fin clase EditProveedorScreen

// Clase que representa el cuerpo de la pantalla de edición de proveedores
class _ProveedorScreenBody extends StatelessWidget {
  const _ProveedorScreenBody({
    Key? key,
    required this.proveedorService, // Se requiere el servicio de proveedores
  }) : super(key: key);

  final ProveedorService
      proveedorService; // Servicio de proveedores que maneja las operaciones

  @override
  Widget build(BuildContext context) {
    final proveedorForm = Provider.of<ProveedorFormProvider>(
        context); // Accede al estado del formulario del proveedor
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const Divider(height: 150.0), // Espaciador en la parte superior
                AppBar(
                  title: const Text(
                      'Registro de Proveedores'), // Título del AppBar
                ),
              ],
            ),
            _ProveedorForm(), // Formulario para editar el proveedor
          ],
        ),
      ),
      // Botones flotantes para eliminar y guardar el proveedor
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 70),
          FloatingActionButton(
            child: const Icon(
                Icons.delete_forever), // Botón para eliminar el proveedor
            onPressed: () async {
              if (!proveedorForm.isValidForm()) {
                return; // Verifica si el formulario es válido
              }
              await proveedorService.deleteProveedor(
                  proveedorForm.proveedor, context); // Elimina el proveedor
            },
            heroTag: null,
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            child: const Icon(
                Icons.save_alt_outlined), // Botón para guardar el proveedor
            onPressed: () async {
              if (!proveedorForm.isValidForm()) {
                return; // Verifica si el formulario es válido
              }
              await proveedorService.editOrCreateProveedor(
                  proveedorForm.proveedor); // Edita o crea el proveedor
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
} // Fin clase _ProveedorScreenBody

// Clase que define el formulario para editar el proveedor
class _ProveedorForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final proveedorForm = Provider.of<ProveedorFormProvider>(
        context); // Accede al formulario del proveedor
    final proveedor = proveedorForm.proveedor; // Obtiene el proveedor actual

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width:
            double.infinity, // El formulario ocupará todo el ancho disponible
        decoration:
            _createDecoration(), // Aplica una decoración personalizada al formulario
        child: Form(
          key: proveedorForm.formKey, // Llave del formulario
          autovalidateMode: AutovalidateMode
              .onUserInteraction, // Valida el formulario cuando el usuario interactúa
          child: Column(
            children: [
              // Campo de texto para el nombre del proveedor
              TextFormField(
                initialValue:
                    proveedor.proveedorName, // Valor inicial del campo
                onChanged: (value) => proveedor.proveedorName =
                    value, // Actualiza el nombre del proveedor
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nombre es obligatorio'; // Valida el campo
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Nombre del proveedor',
                  labelText: 'Nombre', // Etiqueta del campo
                ),
              ),
              // Campo de texto para el apellido del proveedor
              TextFormField(
                initialValue:
                    proveedor.proveedorLastName, // Valor inicial del campo
                onChanged: (value) => proveedor.proveedorLastName =
                    value, // Actualiza el apellido del proveedor
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Apellido es obligatorio'; // Valida el campo
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Apellido del proveedor',
                  labelText: 'Apellido', // Etiqueta del campo
                ),
              ),
              // Campo de texto para el email del proveedor
              TextFormField(
                initialValue:
                    proveedor.proveedorEmail, // Valor inicial del campo
                onChanged: (value) => proveedor.proveedorEmail =
                    value, // Actualiza el email del proveedor
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email es obligatorio'; // Valida el campo
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Email del proveedor',
                  labelText: 'Email', // Etiqueta del campo
                ),
              ),
              // Campo de texto para el estado del proveedor
              TextFormField(
                initialValue:
                    proveedor.proveedorState, // Valor inicial del campo
                onChanged: (value) => proveedor.proveedorState =
                    value, // Actualiza el estado del proveedor
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Estado es obligatorio'; // Valida el campo
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Estado del proveedor',
                  labelText: 'Estado', // Etiqueta del campo
                ),
              ),
              const SizedBox(height: 20), // Espaciador
            ],
          ),
        ),
      ),
    );
  }

  // Método que crea una decoración personalizada para el contenedor del formulario
  BoxDecoration _createDecoration() => const BoxDecoration(
        color: Color.fromARGB(255, 224, 224, 224), // Color de fondo gris claro
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
              25), // Bordes redondeados en la parte inferior izquierda
          bottomRight: Radius.circular(
              25), // Bordes redondeados en la parte inferior derecha
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black, // Sombra negra
            offset: Offset(0, 5), // Desplazamiento de la sombra
            blurRadius: 10, // Difuminado de la sombra
          ),
        ],
      );
} // Fin clase _ProveedorForm
