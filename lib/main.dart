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
      theme: ThemeData().copyWith(
        brightness: MediaQuery.of(context).platformBrightness,
        useMaterial3: false,
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Splash.routeName,
    );
  }
}
