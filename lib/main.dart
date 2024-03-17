import 'package:amruta_ayurveda/cores/routes.dart';
import 'package:amruta_ayurveda/logic/services/dependancy_injection.dart';
import 'package:amruta_ayurveda/presentation/screens/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amruta Ayurveda',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white, foregroundColor: Colors.black),
        textTheme: TextTheme(
            bodyMedium: TextStyle(color: Colors.black),
            bodySmall: TextStyle(color: Colors.black),
            bodyLarge: TextStyle(color: Colors.black, fontSize: 12)),
        primaryTextTheme: TextTheme(titleLarge: TextStyle(color: Colors.black)),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 104, 55, 1.000)),
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Splash.routeName,
    );
  }
}
