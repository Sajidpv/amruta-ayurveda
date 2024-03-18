import 'package:amruta_ayurveda/cores/device_info.dart';
import 'package:amruta_ayurveda/presentation/screens/login%20screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences pref;

class Splash extends StatefulWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  static const String routeName = 'splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    initSharedPreferences();
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initSharedPreferences() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: DeviceInfo(context).height,
        height: DeviceInfo(context).height,
        child: Image(
          fit: BoxFit.fill,
          image: AssetImage('images/splash.png'),
        ),
      ),
    );
  }
}
