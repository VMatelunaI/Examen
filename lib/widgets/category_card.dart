// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/models/categorias.dart'; // Importa el modelo de categorías

// Clase que representa una tarjeta de categoría con detalles
class CategoryCard extends StatelessWidget {
  // Recibe un objeto de tipo categoría
  final Listadocat category;

  // Constructor que recibe la categoría
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retorna un padding alrededor de la tarjeta para que no quede pegada a los bordes
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20), // Espacio lateral
      child: Container(
        margin:
            const EdgeInsets.only(top: 30, bottom: 50), // Márgenes verticales
        width: double.infinity, // Ancho completo
        height: 250, // Altura de la tarjeta
        decoration: _cardDecorations(), // Aplicar decoración de la tarjeta
        child: Stack(
          alignment:
              Alignment.bottomLeft, // Alineación de los elementos en la tarjeta
          children: [
            _CategoryDetails(category: category), // Detalles de la categoría
            Positioned(
                top: 0,
                right: 0,
                child: _PriceTag(category: category)), // Etiqueta de ID
            if (category.categoryState ==
                'bloqueado') // Si la categoría está bloqueada
              Positioned(
                  top: 0,
                  left: 0,
                  child:
                      _State(category: category)), // Mostrar estado "bloqueado"
          ],
        ),
      ),
    ); // Fin Padding
  }

  // Método que retorna la decoración de la tarjeta
  BoxDecoration _cardDecorations() => BoxDecoration(
        color: Colors.white, // Fondo blanco
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
} // Fin clase CategoryCard

// Clase que muestra la etiqueta de ID en la parte superior derecha de la tarjeta
class _PriceTag extends StatelessWidget {
  final Listadocat category;

  const _PriceTag({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Ancho de la etiqueta
      height: 80, // Altura de la etiqueta
      alignment: Alignment.center, // Alineación centrada del texto
      decoration: const BoxDecoration(
          color: Colors.blue, // Fondo azul para la etiqueta
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
      child: FittedBox(
        fit: BoxFit.contain, // Ajusta el contenido al tamaño del contenedor
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('Categoría: ${category.categoryId}',
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    ); // Fin Container
  }
} // Fin clase _PriceTag

// Clase que muestra el estado de la categoría en la parte superior izquierda
class _State extends StatelessWidget {
  final Listadocat category;

  const _State({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Ancho de la etiqueta de estado
      height: 40, // Altura de la etiqueta de estado
      alignment: Alignment.center, // Alineación centrada del texto
      decoration: const BoxDecoration(
          color: Colors.red, // Fondo rojo para estado bloqueado
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
      child: FittedBox(
        fit: BoxFit.contain, // Ajusta el contenido al tamaño del contenedor
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(category.categoryState,
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    ); // Fin Container
  }
} // Fin clase _State

// Clase que muestra los detalles de la categoría (nombre y estado)
class _CategoryDetails extends StatelessWidget {
  final Listadocat category;

  const _CategoryDetails({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50), // Espacio lateral derecho
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 10), // Padding interno
        width: double.infinity, // Ancho completo
        height: 150, // Altura del contenedor de detalles
        decoration:
            _boxDecorations(), // Aplicar decoración al fondo de detalles
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alineación del texto a la izquierda
          children: [
            // Texto que muestra "Nombre="
            const Text(
              'Nombre:',
              style: TextStyle(fontSize: 15, color: Colors.white),
              maxLines: 2, // Máximo de líneas para el texto
              overflow: TextOverflow.ellipsis, // Elipsis si el texto es largo
            ),
            // Texto que muestra el nombre de la categoría
            Text(
              category.categoryName,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold), // Negrita en el nombre
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            // Texto que muestra el estado de la categoría
            Text(
              'Estado: ${category.categoryState}',
              style: const TextStyle(fontSize: 15, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ); // Fin Padding
  }

  // Método que retorna la decoración para los detalles
  BoxDecoration _boxDecorations() => const BoxDecoration(
        color: Colors.blue, // Fondo azul para los detalles
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ); // Fin BoxDecoration
} // Fin clase _CategoryDetails
