// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/models/productos.dart'; // Importa el modelo de productos

// Clase que representa una tarjeta de producto con detalles
class ProductCard extends StatelessWidget {
  // Recibe un objeto de tipo producto
  final Listado product;

  // Constructor que recibe el producto
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retorna un padding alrededor de la tarjeta para darle espacio lateral
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20), // Espacio lateral
      child: Container(
        margin:
            const EdgeInsets.only(top: 30, bottom: 50), // Márgenes verticales
        width: double.infinity, // Ancho completo
        height: 250, // Altura de la tarjeta
        decoration: _cardDecorations(), // Aplicar decoración de la tarjeta
        child: Stack(
          alignment: Alignment
              .bottomLeft, // Alineación de los elementos dentro de la tarjeta
          children: [
            _BackGroundImage(
                url: product.productImage), // Imagen de fondo del producto
            _ProductDetails(product: product), // Detalles del producto
            Positioned(
                top: 0,
                right: 0,
                child: _PriceTag(product: product)), // Precio del producto
            if (product.productState ==
                'bloqueado') // Si el producto está bloqueado
              Positioned(
                  top: 0,
                  left: 0,
                  child: _State(product: product)) // Estado "bloqueado"
          ],
        ),
      ),
    ); // Fin Padding
  }

  // Método que retorna la decoración de la tarjeta
  BoxDecoration _cardDecorations() => BoxDecoration(
        color: Colors.white, // Fondo blanco para la tarjeta
        borderRadius: BorderRadius.circular(25), // Bordes redondeados
        boxShadow: const [
          // Sombra debajo de la tarjeta
          BoxShadow(
            color: Colors.black, // Color de la sombra
            offset: Offset(0, 5), // Desplazamiento de la sombra
            blurRadius: 10, // Desenfoque de la sombra
          )
        ],
      ); // Fin BoxDecoration
} // Fin clase ProductCard

// Clase que muestra la etiqueta de precio en la parte superior derecha de la tarjeta
class _PriceTag extends StatelessWidget {
  final Listado product;

  const _PriceTag({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Ancho de la etiqueta de precio
      height: 70, // Altura de la etiqueta de precio
      alignment: Alignment.center, // Alineación centrada del texto
      decoration: const BoxDecoration(
          color: Colors.blueAccent, // Fondo azul para el precio
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
      child: FittedBox(
        fit: BoxFit.contain, // Ajusta el contenido al tamaño del contenedor
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$${product.productPrice}',
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    ); // Fin Container
  }
} // Fin clase _PriceTag

// Clase que muestra el estado del producto en la parte superior izquierda
class _State extends StatelessWidget {
  final Listado product;

  const _State({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Ancho de la etiqueta de estado
      height: 40, // Altura de la etiqueta de estado
      alignment: Alignment.center, // Alineación centrada del texto
      decoration: const BoxDecoration(
          color: Colors.red, // Fondo rojo si está bloqueado
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
      child: FittedBox(
        fit: BoxFit.contain, // Ajusta el contenido al tamaño del contenedor
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(product.productState,
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    ); // Fin Container
  }
} // Fin clase _State

// Clase que muestra los detalles del producto (nombre y SKU)
class _ProductDetails extends StatelessWidget {
  final Listado product;

  const _ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50), // Espacio lateral derecho
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 10), // Padding interno
        width: double.infinity, // Ancho completo
        height: 80, // Altura del contenedor de detalles
        decoration:
            _boxDecorations(), // Aplicar decoración al fondo de detalles
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alineación del texto a la izquierda
          children: [
            // Texto que muestra el nombre del producto
            Text(
              product.productName,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white, // Texto blanco para mejor contraste
                  fontWeight: FontWeight.bold), // Negrita en el nombre
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Elipsis si el texto es largo
            ),
            // Texto que muestra "SKU"
            const Text(
              'SKU',
              style:
                  TextStyle(fontSize: 15, color: Colors.white), // Texto blanco
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Elipsis si el texto es largo
            ),
          ],
        ),
      ),
    ); // Fin Padding
  }

  // Método que retorna la decoración para los detalles del producto
  BoxDecoration _boxDecorations() => const BoxDecoration(
        color: Colors.blueAccent, // Fondo azul para los detalles
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ); // Fin BoxDecoration
} // Fin clase _ProductDetails

// Clase que muestra la imagen de fondo del producto
class _BackGroundImage extends StatelessWidget {
  final String? url;

  const _BackGroundImage({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retorna un ClipRRect para recortar la imagen con bordes redondeados
    return ClipRRect(
      borderRadius: BorderRadius.circular(25), // Bordes redondeados
      child: SizedBox(
        width: double.infinity, // Ancho completo
        height: 400, // Altura de la imagen de fondo
        child: url == null
            ? const Image(
                image: AssetImage(
                    'assets/no-image.png'), // Imagen por defecto si no hay URL
                fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
              )
            : FadeInImage(
                placeholder: const AssetImage(
                    'assets/jar-loading.gif'), // Imagen de carga
                image: NetworkImage(url!), // Imagen de la URL
                fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
              ),
      ),
    ); // Fin ClipRRect
  }
} // Fin clase _BackGroundImage
