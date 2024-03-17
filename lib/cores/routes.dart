import 'package:amruta_ayurveda/logic/provider/login_provider.dart';
import 'package:amruta_ayurveda/presentation/screens/login%20screen/login_screen.dart';
import 'package:amruta_ayurveda/presentation/screens/splash%20screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => LoginProvider(context),
                child: const LoginPage()));

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
