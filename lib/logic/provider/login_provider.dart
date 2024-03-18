import 'package:amruta_ayurveda/data/models/login_model.dart';
import 'package:amruta_ayurveda/data/repository/user_repository.dart';
import 'package:amruta_ayurveda/presentation/screens/home%20screen/home_screen.dart';
import 'package:amruta_ayurveda/presentation/screens/splash%20screen/splash_screen.dart';
import 'package:amruta_ayurveda/presentation/widgets/show_snackbar.dart';
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
    try {
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
        Navigator.pushReplacementNamed(context, HomePage.routeName);
        notifyListeners();
      } else {
        isLoading = false;
        customSnackbar(message: res.message!);
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      print(e.toString());
      notifyListeners();
      customSnackbar(message: 'Error Occured! Check your connection');
    }
  }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }
}
