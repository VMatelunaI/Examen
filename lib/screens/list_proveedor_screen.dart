// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/models/proveedores.dart'; // Importa el modelo de proveedores
import '/services/proveedor_service.dart'; // Importa el servicio de proveedores
import '/widgets/proveedor_card.dart'; // Importa el widget para mostrar los proveedores
import 'package:provider/provider.dart'; // Importa Provider para la gestión del estado
import '/screens/screen.dart'; // Importa las pantallas adicionales

// Pantalla para listar los proveedores disponibles
class ListProveedorScreen extends StatelessWidget {
  const ListProveedorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final proveedorService = Provider.of<ProveedorService>(
        context); // Accede al servicio de proveedores

    // Si el servicio está cargando, muestra una pantalla de carga
    if (proveedorService.isLoading)
      return LoadingScreen(); // Retorna la pantalla de carga mientras se cargan los datos

    // Construye la pantalla de proveedores
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proveedores Disponibles'), // Título del AppBar
      ),
      // ListView para mostrar los proveedores en forma de lista
      body: ListView.builder(
        itemCount: proveedorService
            .proveedores.length, // Número de proveedores disponibles
        itemBuilder: (BuildContext context, index) => GestureDetector(
          // Al hacer tap en un proveedor, navega a la pantalla de edición
          onTap: () {
            proveedorService.SelectProveedor = proveedorService
                .proveedores[index]
                .copy(); // Selecciona el proveedor a editar
            Navigator.pushNamed(context,
                'editprov'); // Navega a la pantalla de edición de proveedores
          },
          child: ProveedorCard(
              proveedor: proveedorService
                  .proveedores[index]), // Muestra la tarjeta del proveedor
        ),
      ),
      // Botón flotante para agregar un nuevo proveedor
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), // Icono de agregar
        onPressed: () {
          // Inicializa un nuevo proveedor vacío y navega a la pantalla de edición
          proveedorService.SelectProveedor = Listadop(
            proveedorId: 0,
            proveedorName: '',
            proveedorLastName: '',
            proveedorEmail: '',
            proveedorState: '',
          );
          Navigator.pushNamed(context,
              'editprov'); // Navega a la pantalla de edición del nuevo proveedor
        },
      ),
    );
  }
} // Fin clase ListProveedorScreen
