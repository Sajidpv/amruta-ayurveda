import 'package:amruta_ayurveda/cores/device_info.dart';
import 'package:amruta_ayurveda/logic/provider/login_provider.dart';
import 'package:amruta_ayurveda/presentation/widgets/circular_loading_indicator.dart';
import 'package:amruta_ayurveda/presentation/widgets/primary_button.dart';
import 'package:amruta_ayurveda/presentation/widgets/spacer_widgets.dart';
import 'package:amruta_ayurveda/presentation/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          Container(
              alignment: Alignment.center,
              child: Stack(children: [
                Image(
                    fit: BoxFit.fill,
                    image: AssetImage('images/login-background.png')),
                Positioned.fill(
                  top: DeviceInfo(context).height! / 9,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 51.0),
                      child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage('images/logo-1-2.png')),
                    ),
                  ),
                ),
              ])),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              decoration: BoxDecoration(),
              height: screenHeight * 0.75,
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 15),
              child: Form(
                key: provider.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Devider(
                        height: 25,
                      ),
                      Text(
                        'Login Or Regster to Book Your Appointments',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Devider(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('  Email'),
                          Devider(
                            height: 10,
                          ),
                          TextFormField(
                              controller: provider.userController,
                              textInputAction: TextInputAction.next,
                              autocorrect: false,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(fontSize: 10),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                ),
                                hintText: 'Enter your email',
                              ),
                              onChanged: (value) {},
                              validator: validateEmail),
                        ],
                      ),
                      Devider(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Password'),
                          Devider(
                            height: 10,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            controller: provider.passController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: provider.isObscure,
                            enableSuggestions: false,
                            autocorrect: false,
                            style: const TextStyle(fontSize: 10),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                ),
                                hintText: 'Enter password',
                                label: Text('Password'),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    provider.clickedIsObscure();
                                  },
                                  icon: provider.isObscure
                                      ? Icon(Icons.visibility_off_outlined)
                                      : Icon(Icons.visibility_outlined),
                                  iconSize: 15,
                                )),
                            validator: validatePassword,
                          ),
                        ],
                      ),
                      Devider(
                        height: 50,
                      ),
                      Consumer<LoginProvider>(
                          builder: (context, provider, child) {
                        return provider.isLoading
                            ? Circular_Loading_indicator()
                            : PrimaryButton(
                                label: 'Login',
                                onPressed: provider.logIn,
                              );
                      }),
                      Devider(
                        height: 50,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'By creating or logging into an account you are agreeing with our Terms and Condiions and Privacy Policy',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
