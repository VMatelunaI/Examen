import '/theme/theme.dart';

class MenuFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
