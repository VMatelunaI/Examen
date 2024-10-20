// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/providers/product_form_provider.dart'; // Importa el proveedor del formulario de producto
import '/services/product_service.dart'; // Importa el servicio de producto
import '/widgets/product_image.dart'; // Importa el widget para manejar la imagen del producto
import 'package:provider/provider.dart'; // Importa Provider para gestión de estado
import '../ui/input_decorations.dart'; // Importa decoraciones de input

// Pantalla para editar un producto
class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene el servicio de productos mediante el Provider
    final productService = Provider.of<ProductService>(context);

    // Asocia el ProductFormProvider con el producto seleccionado
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.SelectProduct!),
      child: _ProductScreenBody(
        productService:
            productService, // Pasa el servicio de productos al cuerpo de la pantalla
      ),
    );
  }
} // Fin clase EditProductScreen

// Clase que representa el cuerpo de la pantalla para editar productos
class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService, // El servicio de productos es requerido
  }) : super(key: key);

  final ProductService
      productService; // Servicio de productos que maneja las operaciones

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(
        context); // Accede al estado del formulario de producto

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              ProductImage(
                url: productService.SelectProduct!
                    .productImage, // Muestra la imagen del producto
              ),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  onPressed: () => Navigator.of(context)
                      .pop(), // Botón para regresar a la pantalla anterior
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          _ProductForm(), // Formulario para editar el producto
        ]),
      ),
      // Botones flotantes para comprar, eliminar y guardar el producto
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.shopping_cart),
            onPressed: () async {
              if (!productForm.isValidForm()) {
                return; // Verifica si el formulario es válido
              }
              await productService.shopProduct(productForm.product,
                  context); // Lógica para comprar el producto
            },
            heroTag: null,
          ),
          const SizedBox(width: 170),
          FloatingActionButton(
            child: const Icon(Icons.delete_forever),
            onPressed: () async {
              if (!productForm.isValidForm()) {
                return; // Verifica si el formulario es válido
              }
              await productService.deleteProduct(
                  productForm.product, context); // Elimina el producto
            },
            heroTag: null,
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            child: const Icon(Icons.save_alt_outlined),
            onPressed: () async {
              if (!productForm.isValidForm()) {
                return; // Verifica si el formulario es válido
              }
              await productService.editOrCreateProduct(
                  productForm.product); // Edita o crea el producto
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
} // Fin clase _ProductScreenBody

// Clase que define el formulario para editar el producto
class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(
        context); // Accede al formulario de producto
    final product = productForm.product; // Obtiene el producto actual

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width:
            double.infinity, // El formulario ocupará todo el ancho disponible
        decoration:
            _createDecoration(), // Aplica decoración personalizada al formulario
        child: Form(
          key: productForm.formKey, // Llave del formulario
          autovalidateMode: AutovalidateMode
              .onUserInteraction, // Valida el formulario cuando el usuario interactúa
          child: Column(
            children: [
              // Campo de texto para el nombre del producto
              TextFormField(
                initialValue: product.productName, // Valor inicial del campo
                onChanged: (value) => product.productName =
                    value, // Actualiza el nombre del producto
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nombre obligatorio'; // Valida el campo
                  }
                  return null;
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Nombre del producto',
                  labelText: 'Nombre', // Etiqueta del campo
                ),
              ),
              // Campo de texto para la URL de la imagen del producto
              TextFormField(
                initialValue: product.productImage, // Valor inicial del campo
                onChanged: (value) => product.productImage =
                    value, // Actualiza la URL de la imagen del producto
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese URL de imagen'; // Valida el campo
                  }
                  return null;
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Imagen del producto',
                  labelText: 'Imagen', // Etiqueta del campo
                ),
              ),
              const SizedBox(height: 20),
              // Campo de texto para el precio del producto
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue:
                    product.productPrice.toString(), // Valor inicial del campo
                onChanged: (value) {
                  if (int.tryParse(value) == null) {
                    product.productPrice = 0; // Si no es un número, se asigna 0
                  } else {
                    product.productPrice =
                        int.parse(value); // Convierte el valor a entero
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: '-----',
                  labelText: 'Precio', // Etiqueta del campo
                ),
              ),
              const SizedBox(height: 20),
              // Switch para indicar si el producto está disponible o no
              SwitchListTile.adaptive(
                value:
                    true, // Siempre activado (se puede cambiar según necesidad)
                onChanged: (value) {}, // Lógica adicional puede ir aquí
                activeColor: Colors.blue, // Color cuando está activo
                title: const Text('Disponible'), // Texto asociado al switch
              ),
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
} // Fin clase _ProductForm
