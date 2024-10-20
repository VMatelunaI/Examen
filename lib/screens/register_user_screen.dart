// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Importa los componentes de Flutter
import '/services/auth_service.dart'; // Importa el servicio de autenticación
import '/widgets/widgets.dart'; // Importa los widgets personalizados
import 'package:provider/provider.dart'; // Importa Provider para la gestión del estado
import '/providers/providers.dart'; // Importa los proveedores de estado
import '../ui/input_decorations.dart'; // Importa las decoraciones para los inputs

// Pantalla para registrar una nueva cuenta de usuario
class RegisterUserScreen extends StatelessWidget {
  const RegisterUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo personalizado para la pantalla de autenticación
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150, // Espacio en la parte superior
              ),
              // Contenedor tipo tarjeta con el formulario de registro
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10), // Espacio entre los elementos
                    Text(
                      'Registra una cuenta', // Título de la pantalla
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall, // Aplica el tema de texto
                    ),
                    const SizedBox(height: 30), // Espacio adicional
                    // Proveedor del formulario de inicio de sesión
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const RegisterForm(), // Formulario de registro
                    ),
                    const SizedBox(
                        height: 50), // Espacio entre formulario y el texto
                    // Botón para navegar a la pantalla de inicio de sesión si ya se tiene cuenta
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, 'login'), // Navega a la pantalla de login
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.all(Colors.indigo
                            .withOpacity(0.1)), // Efecto al presionar
                        shape: WidgetStateProperty.all(
                            const StadiumBorder()), // Bordes del botón
                      ),
                      child: const Text(
                          '¿Ya tienes una cuenta?, autentificate acá'), // Texto del botón
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ); // Fin Scaffold
  }
} // Fin clase RegisterUserScreen

// Clase que representa el formulario de registro
class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginForm = Provider.of<LoginFormProvider>(
        context); // Accede al estado del formulario de login

    return Container(
      child: Form(
        key: LoginForm.formKey, // Llave del formulario para validaciones
        autovalidateMode: AutovalidateMode
            .onUserInteraction, // Valida mientras el usuario interactúa
        child: Column(
          children: [
            // Campo de texto para ingresar el email
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecortions.authInputDecoration(
                hinText: 'Ingrese su correo', // Texto de sugerencia
                labelText: 'Email', // Etiqueta del campo
                prefixIcon: Icons.people, // Icono del campo
              ),
              onChanged: (value) => LoginForm.email =
                  value, // Actualiza el email en el formulario
              validator: (value) {
                return (value != null && value.length >= 4)
                    ? null
                    : 'El usuario no puede estar vacio'; // Valida que el email no esté vacío
              },
            ),
            const SizedBox(height: 30), // Espacio entre los campos
            // Campo de texto para ingresar la contraseña
            TextFormField(
              autocorrect: false,
              obscureText: true, // Oculta el texto (para contraseñas)
              keyboardType: TextInputType.text,
              decoration: InputDecortions.authInputDecoration(
                hinText: '************', // Texto de sugerencia
                labelText: 'Password', // Etiqueta del campo
                prefixIcon: Icons.lock_outline, // Icono del campo
              ),
              onChanged: (value) => LoginForm.password =
                  value, // Actualiza la contraseña en el formulario
              validator: (value) {
                return (value != null && value.length >= 4)
                    ? null
                    : 'La contraseña no puede estar vacio'; // Valida que la contraseña no esté vacía
              },
            ),
            const SizedBox(height: 30), // Espacio adicional
            // Botón para registrar una nueva cuenta
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
              ),
              disabledColor:
                  Colors.grey, // Color cuando el botón está deshabilitado
              color: Colors.orange,
              elevation: 0,
              // Acción al presionar el botón
              onPressed: LoginForm.isLoading
                  ? null // Si está cargando, el botón está deshabilitado
                  : () async {
                      FocusScope.of(context)
                          .unfocus(); // Cierra el teclado si está abierto
                      final authService = Provider.of<AuthService>(context,
                          listen: false); // Accede al servicio de autenticación
                      if (!LoginForm.isValidForm())
                        return; // Si el formulario no es válido, no procede
                      LoginForm.isLoading = true; // Activa el estado de carga
                      // Crea un nuevo usuario en Firebase
                      final String? errorMessage = await authService
                          .create_user(LoginForm.email, LoginForm.password);
                      // Si no hay error, navega al login
                      if (errorMessage == null) {
                        Navigator.pushNamed(
                            context, 'login'); // Navega a la pantalla de login
                      } else {
                        if (kDebugMode) {
                          print(errorMessage);
                        } // Imprime el error si lo hay
                      }
                    }, // Color del botón
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 80, vertical: 10), // Tamaño del botón
                child: const Text(
                  'Registrar', // Texto del botón
                  style: TextStyle(color: Colors.white), // Color del texto
                ),
              ),
            ),
          ],
        ),
      ),
    ); // Fin Container
  }
} // Fin clase RegisterForm
