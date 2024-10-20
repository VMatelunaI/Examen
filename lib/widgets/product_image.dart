// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter

// Clase que muestra una imagen de producto con un estilo decorativo
class ProductImage extends StatelessWidget {
  // URL de la imagen del producto (puede ser nula)
  final String? url;

  // Constructor que recibe la URL de la imagen (opcional)
  const ProductImage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    // Retorna un Padding que envuelve el contenedor de la imagen
    return Padding(
      padding: const EdgeInsets.only(
          left: 10, top: 10, right: 10), // Espacio alrededor de la imagen
      child: Container(
          decoration:
              _createDecoration(), // Aplica la decoración con tonos azulados
          width: double.infinity, // Abarca todo el ancho disponible
          height: 400, // Altura de la imagen
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45)), // Bordes redondeados superiores
            child: url == null
                ? const Image(
                    // Si no hay URL, muestra una imagen por defecto
                    image: AssetImage('assets/no-image.png'),
                    fit: BoxFit.cover, // Ajusta la imagen al contenedor
                  )
                : FadeInImage(
                    // Muestra la imagen desde la URL
                    placeholder: const AssetImage(
                        'assets/jar-loading.gif'), // Imagen de carga
                    image: NetworkImage(url!), // Imagen de la URL
                    fit: BoxFit.cover, // Ajusta la imagen al contenedor
                  ),
          )),
    ); // Fin Padding
  }

  // Método que retorna la decoración para el contenedor de la imagen
  BoxDecoration _createDecoration() => const BoxDecoration(
        color: Colors.blueAccent, // Color de fondo azul
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45)), // Bordes redondeados
        boxShadow: [
          // Sombra debajo del contenedor para darle un efecto de elevación
          BoxShadow(
            color: Colors.black, // Color de la sombra
            offset: Offset(0, 5), // Desplazamiento de la sombra
            blurRadius: 10, // Desenfoque de la sombra
          )
        ],
      ); // Fin BoxDecoration
} // Fin clase ProductImage
