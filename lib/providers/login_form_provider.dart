// Proyecto: Examen Computación Móvil
// Autor   : Victor Mateluna Iturrieta
// Base    : Base obtenida de clases Computación Móvil
//-------------------------------------------------------------------------

import '/theme/theme.dart'; // Importa el tema personalizado de la aplicación

// Clase LoginFormProvider que gestiona el formulario de inicio de sesión
class LoginFormProvider extends ChangeNotifier {
  // Llave global que permite acceder al estado del formulario
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  // Campos que se gestionan en el formulario de login: email y contraseña
  String email = ''; // Campo para el correo electrónico
  String password = ''; // Campo para la contraseña

  // Variable privada para manejar el estado de carga (loading)
  bool _isLoading = false;

  // Getter que devuelve el estado de carga (_isLoading)
  bool get isLoading => _isLoading;

  // Setter que cambia el valor de _isLoading y notifica los cambios
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners(); // Notifica a los widgets que dependen de este proveedor para redibujarse
  }

  // Método que valida el formulario, retorna true si es válido, false si no lo es
  bool isValidForm() {
    return formKey.currentState?.validate() ??
        false; // Valida si el formulario no es nulo
  }
} // Fin clase LoginFormProvider
