import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final BuildContext context;
  LoginProvider(this.context) {
    ;
  }
  bool isLoading = false, isObscure = true;
  final userController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void clickedIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void logIn() async {
    if (!formKey.currentState!.validate()) return;
    String email = userController.text.trim();
    String password = passController.text.trim();
    final lData = {'email': email, 'password': password};
  }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }
}
