import 'package:amruta_ayurveda/cores/device_info.dart';
import 'package:amruta_ayurveda/presentation/screens/login%20screen/login_screen.dart';
import 'package:amruta_ayurveda/presentation/screens/register%20screen/screen_add_user.dart';
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
  // Future<void> _initPackageInfo() async {
  //   final PackageInfo info = await PackageInfo.fromPlatform();
  //   print(info);
  //   setState(() {
  //     _packageInfo = info;
  //   });
  // }

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    // _initPackageInfo();
    initSharedPreferences();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    });
  }

  @override
  void dispose() {
    controller.dispose();
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
