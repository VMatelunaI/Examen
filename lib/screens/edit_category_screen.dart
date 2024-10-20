// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/providers/category_form_provider.dart'; // Importa el proveedor del formulario de categoría
import '/services/category_service.dart'; // Importa el servicio de categoría
import 'package:provider/provider.dart'; // Importa Provider para gestión del estado
import '../ui/input_decorations.dart'; // Importa decoraciones de input

// Clase principal que representa la pantalla para editar categorías
class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Accede al servicio de categorías a través del proveedor
    final categoryService = Provider.of<CategoryService>(context);

    // Cambia el estado de CategoryFormProvider al seleccionar una categoría
    return ChangeNotifierProvider(
      create: (_) => CategoryFormProvider(categoryService.SelectCategory!),
      child: _CategoryScreenBody(
        categoryService:
            categoryService, // Pasa el servicio de categorías al cuerpo de la pantalla
      ),
    );
  }
} // Fin clase EditCategoryScreen

// Clase que representa el cuerpo de la pantalla de edición de categorías
class _CategoryScreenBody extends StatelessWidget {
  const _CategoryScreenBody({
    required this.categoryService, // El servicio de categorías es requerido
  });

  final CategoryService
      categoryService; // Servicio de categoría que maneja las operaciones
  @override
  Widget build(BuildContext context) {
    final categoryForm = Provider.of<CategoryFormProvider>(
        context); // Accede al estado del formulario de categoría
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const Divider(height: 150.0), // Espaciador en la parte superior
                AppBar(
                  title:
                      const Text('Registro de Categorías'), // Título del AppBar
                ),
              ],
            ),
            _CategoryForm(), // Formulario para editar categorías
          ],
        ),
      ),
      // Botones flotantes para eliminar y guardar la categoría
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 170),
          FloatingActionButton(
            child: const Icon(
                Icons.delete_forever), // Botón para eliminar la categoría
            onPressed: () async {
              if (!categoryForm.isValidForm()) {
                return; // Verifica si el formulario es válido
              }
              await categoryService.deleteCategory(
                  categoryForm.category, context); // Elimina la categoría
            },
            heroTag: null,
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            child: const Icon(
                Icons.save_alt_outlined), // Botón para guardar la categoría
            onPressed: () async {
              if (!categoryForm.isValidForm()) {
                return; // Verifica si el formulario es válido
              }
              await categoryService.editOrCreateCategory(
                  categoryForm.category); // Guarda o edita la categoría
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
} // Fin clase _CategoryScreenBody

// Clase que define el formulario para la edición de categorías
class _CategoryForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryForm = Provider.of<CategoryFormProvider>(
        context); // Accede al formulario de categoría
    final category = categoryForm.category; // Obtiene la categoría actual

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width:
            double.infinity, // El formulario ocupará todo el ancho disponible
        decoration:
            _createDecoration(), // Aplica decoración personalizada al formulario
        child: Form(
          key: categoryForm.formKey, // Llave del formulario
          autovalidateMode: AutovalidateMode
              .onUserInteraction, // Valida el formulario cuando el usuario interactúa
          child: Column(
            children: [
              // Campo de texto para el nombre de la categoría
              TextFormField(
                initialValue: category.categoryName, // Valor inicial del campo
                onChanged: (value) => category.categoryName =
                    value, // Actualiza el nombre de la categoría
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nombre es obligatorio'; // Valida el campo
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Nombre de categoria',
                  labelText: 'Nombre', // Etiqueta del campo
                ),
              ),
              // Campo de texto para el estado de la categoría
              TextFormField(
                initialValue: category.categoryState, // Valor inicial del campo
                onChanged: (value) => category.categoryState =
                    value, // Actualiza el estado de la categoría
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Estado es obligatorio'; // Valida el campo
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Estado de categoría',
                  labelText: 'Estado', // Etiqueta del campo
                ),
              ),
              const SizedBox(height: 100), // Espaciador
            ],
          ),
        ),
      ),
    );
  }

  // Método que crea una decoración personalizada para el contenedor del formulario
  BoxDecoration _createDecoration() => const BoxDecoration(
        color: Colors.white, // Color de fondo blanco
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
              15), // Bordes redondeados en la parte inferior izquierda
          bottomRight: Radius.circular(
              15), // Bordes redondeados en la parte inferior derecha
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black, // Sombra negra
            offset: Offset(0, 5), // Desplazamiento de la sombra
            blurRadius: 10, // Difuminado de la sombra
          )
        ],
      );
} // Fin clase _CategoryForm
