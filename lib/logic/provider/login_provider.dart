import 'package:amruta_ayurveda/data/models/login_model.dart';
import 'package:amruta_ayurveda/data/repository/user_repository.dart';
import 'package:amruta_ayurveda/presentation/screens/register%20screen/screen_add_user.dart';
import 'package:amruta_ayurveda/presentation/screens/splash%20screen/splash_screen.dart';
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

  final UserRepository _userRepository = UserRepository();
  void logIn() async {
    if (!formKey.currentState!.validate()) return;
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    String email = userController.text.trim();
    String password = passController.text.trim();

    final lData = {'email': email, 'password': password};
    final login res = await _userRepository.signIn(lData);
    if (res.status == true) {
      isLoading = false;
      pref.setString('token', res.token!);
      Navigator.pushReplacementNamed(context, SignUpPage.routeName);
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }
}
