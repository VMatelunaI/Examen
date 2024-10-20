// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/models/proveedores.dart'; // Importa el modelo de proveedores

// Clase que representa una tarjeta para mostrar los detalles de un proveedor
class ProveedorCard extends StatelessWidget {
  // Recibe un objeto de tipo proveedor
  final Listadop proveedor;

  // Constructor que recibe el proveedor
  const ProveedorCard({Key? key, required this.proveedor}) : super(key: key);

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
        decoration: _cardDecorations(), // Aplica la decoración de la tarjeta
        child: Stack(
          alignment: Alignment
              .bottomLeft, // Alineación de los elementos dentro de la tarjeta
          children: [
            _ProveedorDetails(proveedor: proveedor), // Detalles del proveedor
            Positioned(
                top: 0,
                right: 0,
                child: _PriceTag(proveedor: proveedor)), // Etiqueta de ID
            if (proveedor.proveedorState ==
                'bloqueado') // Si el proveedor está bloqueado
              Positioned(
                  top: 0,
                  left: 0,
                  child: _State(proveedor: proveedor)), // Estado "bloqueado"
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
} // Fin clase ProveedorCard

// Clase que muestra la etiqueta de ID del proveedor en la parte superior derecha de la tarjeta
class _PriceTag extends StatelessWidget {
  final Listadop proveedor;

  const _PriceTag({Key? key, required this.proveedor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Ancho de la etiqueta de ID
      height: 60, // Altura de la etiqueta de ID
      alignment: Alignment.center, // Alineación centrada del texto
      decoration: const BoxDecoration(
          color: Colors.blueAccent, // Fondo azul para la etiqueta de ID
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
      child: FittedBox(
        fit: BoxFit.contain, // Ajusta el contenido al tamaño del contenedor
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('ID: ${proveedor.proveedorId}',
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    ); // Fin Container
  }
} // Fin clase _PriceTag

// Clase que muestra el estado del proveedor (si está bloqueado) en la parte superior izquierda
class _State extends StatelessWidget {
  final Listadop proveedor;

  const _State({Key? key, required this.proveedor}) : super(key: key);

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
          child: Text('Estado: ${proveedor.proveedorState}',
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    ); // Fin Container
  }
} // Fin clase _State

// Clase que muestra los detalles del proveedor (nombre, apellido, email, estado)
class _ProveedorDetails extends StatelessWidget {
  final Listadop proveedor;

  const _ProveedorDetails({Key? key, required this.proveedor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50), // Espacio lateral derecho
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 10), // Padding interno
        width: double.infinity, // Ancho completo
        height: 180, // Altura del contenedor de detalles
        decoration:
            _boxDecorations(), // Aplicar decoración al fondo de detalles
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alineación del texto a la izquierda
          children: [
            // Texto que muestra el nombre del proveedor
            Text(
              'Nombre: ${proveedor.proveedorName}',
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white, // Texto blanco para mejor contraste
                  fontWeight: FontWeight.bold), // Negrita en el nombre
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Elipsis si el texto es largo
            ),
            // Texto que muestra el apellido del proveedor
            Text(
              'Apellido: ${proveedor.proveedorLastName}',
              style: const TextStyle(
                  fontSize: 15, color: Colors.white), // Texto blanco
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Elipsis si el texto es largo
            ),
            // Texto que muestra el email del proveedor
            Text(
              'Email: ${proveedor.proveedorEmail}',
              style: const TextStyle(
                  fontSize: 15, color: Colors.white), // Texto blanco
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Elipsis si el texto es largo
            ),
            // Texto que muestra el estado del proveedor
            Text(
              'Estado: ${proveedor.proveedorState}',
              style: const TextStyle(
                  fontSize: 15, color: Colors.white), // Texto blanco
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Elipsis si el texto es largo
            ),
          ],
        ),
      ),
    ); // Fin Padding
  }

  // Método que retorna la decoración para los detalles del proveedor
  BoxDecoration _boxDecorations() => const BoxDecoration(
        color: Colors.blueAccent, // Fondo azul para los detalles del proveedor
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), topRight: Radius.circular(15)),
      ); // Fin BoxDecoration
} // Fin clase _ProveedorDetails
