import 'package:amruta_ayurveda/presentation/screens/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case LoginScreen.routeName: return CupertinoPageRoute(
      //   builder: (context) => ChangeNotifierProvider(
      //     create: (context) => LoginProvider(context),
      //     child: const LoginScreen()
      //   )
      // );

      // case SignupScreen.routeName: return CupertinoPageRoute(
      //   builder: (context) => ChangeNotifierProvider(
      //     create: (context) => SignupProvider(context),
      //     child: const SignupScreen()
      //   )
      // );

      case Splash.routeName:
        return MaterialPageRoute(builder: (context) => const Splash());

      default:
        return null;
    }
  }
}
