import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final BuildContext context;
  LoginProvider(this.context) {
    ;
  }
  bool isLoading = false, isObscure = true;
  final companyController = TextEditingController();
  final userController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // void navigateToHomeScreen(role, userId, BuildContext context) async {
  //   switch (role) {
  //     case 'Admin' || 'Owner':
  //       Navigator.pushReplacementNamed(context, AdminHome.routeName,
  //           arguments: userId);
  //       break;

  //     default:
  //       Navigator.pushReplacementNamed(context, LoginPage.routeName);
  //       break;
  //   }
  // }

  void clickedIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void logIn() async {
    if (!formKey.currentState!.validate()) return;
    String companyId = companyController.text.trim();
    String email = userController.text.trim();
    String password = passController.text.trim();
    final lData = {
      'companyMail': companyId,
      'email': email,
      'password': password
    };
    // BlocProvider.of<UserCubit>(context).SignIn(lData);
  }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    companyController.dispose();
    super.dispose();
  }
}
