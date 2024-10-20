// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/models/productos.dart'; // Importa el modelo de productos
import '/services/product_service.dart'; // Importa el servicio de productos
import '/widgets/product_card.dart'; // Importa el widget para mostrar los productos
import 'package:provider/provider.dart'; // Importa Provider para la gestión del estado
import '/screens/screen.dart'; // Importa las pantallas adicionales

// Pantalla para listar los productos disponibles
class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService =
        Provider.of<ProductService>(context); // Accede al servicio de productos

    // Si el servicio está cargando, muestra una pantalla de carga
    if (productService.isLoading)
      return LoadingScreen(); // Retorna la pantalla de carga mientras se cargan los datos

    // Construye la pantalla de productos
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos Disponibles'), // Título del AppBar
      ),
      // ListView para mostrar los productos en forma de lista
      body: ListView.builder(
        itemCount:
            productService.products.length, // Número de productos disponibles
        itemBuilder: (BuildContext context, index) => GestureDetector(
          // Al hacer tap en un producto, navega a la pantalla de edición
          onTap: () {
            productService.SelectProduct = productService.products[index]
                .copy(); // Selecciona el producto a editar
            Navigator.pushNamed(context,
                'edit'); // Navega a la pantalla de edición de productos
          },
          child: ProductCard(
              product: productService
                  .products[index]), // Muestra la tarjeta del producto
        ),
      ),
      // Botón flotante para agregar un nuevo producto
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), // Icono de agregar
        onPressed: () {
          // Inicializa un nuevo producto vacío y navega a la pantalla de edición
          productService.SelectProduct = Listado(
            productId: 0,
            productName: '',
            productPrice: 0,
            productImage:
                'https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem4.jpg',
            productState: '',
          );
          Navigator.pushNamed(context,
              'edit'); // Navega a la pantalla de edición del nuevo producto
        },
      ),
    );
  }
} // Fin clase ListProductScreen
