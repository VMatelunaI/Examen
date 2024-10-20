// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/models/categorias.dart'; // Importa el modelo de categorías
import '/services/category_service.dart'; // Importa el servicio de categorías
import '/widgets/category_card.dart'; // Importa el widget para mostrar las categorías
import 'package:provider/provider.dart'; // Importa Provider para la gestión del estado
import '/screens/screen.dart'; // Importa las pantallas adicionales

// Pantalla para listar las categorías disponibles
class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(
        context); // Accede al servicio de categorías

    // Si el servicio está cargando, muestra una pantalla de carga
    if (categoryService.isLoading)
      return LoadingScreen(); // Retorna la pantalla de carga mientras se cargan los datos

    // Construye la pantalla de categorías
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias Disponibles'), // Título del AppBar
      ),
      // ListView para mostrar las categorías en forma de lista
      body: ListView.builder(
        itemCount: categoryService
            .categorys.length, // Número de categorías disponibles
        itemBuilder: (BuildContext context, index) => GestureDetector(
          // Al hacer tap en una categoría, navega a la pantalla de edición
          onTap: () {
            categoryService.SelectCategory = categoryService.categorys[index]
                .copy(); // Selecciona la categoría a editar
            Navigator.pushNamed(context,
                'editcat'); // Navega a la pantalla de edición de la categoría
          },
          child: CategoryCard(
              category: categoryService
                  .categorys[index]), // Muestra la tarjeta de la categoría
        ),
      ),
      // Botón flotante para agregar una nueva categoría
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), // Icono de agregar
        onPressed: () {
          // Inicializa una nueva categoría vacía y navega a la pantalla de edición
          categoryService.SelectCategory = Listadocat(
            categoryId: 0,
            categoryName: '',
            categoryState: '',
          );
          Navigator.pushNamed(context,
              'editcat'); // Navega a la pantalla de edición de la nueva categoría
        },
      ),
    );
  }
} // Fin clase ListCategoryScreen
