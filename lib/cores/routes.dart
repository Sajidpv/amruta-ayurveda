import 'package:amruta_ayurveda/logic/provider/home_provider.dart';
import 'package:amruta_ayurveda/logic/provider/login_provider.dart';
import 'package:amruta_ayurveda/logic/provider/signup_provider.dart';
import 'package:amruta_ayurveda/presentation/screens/home%20screen/home_screen.dart';
import 'package:amruta_ayurveda/presentation/screens/login%20screen/login_screen.dart';
import 'package:amruta_ayurveda/presentation/screens/register%20screen/screen_add_user.dart';
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
      case SignUpPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider<SignUpProvider>(
                create: (context) => SignUpProvider(context),
              ),
              ChangeNotifierProvider<HomeProvider>(
                create: (context) => HomeProvider(context),
              ),
            ],
            child: SignUpPage(),
          ),
        );

      case Splash.routeName:
        return MaterialPageRoute(builder: (context) => const Splash());
      case HomePage.routeName:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => HomeProvider(context),
                  child: HomePage(),
                ));

      default:
        return null;
    }
  }
}
