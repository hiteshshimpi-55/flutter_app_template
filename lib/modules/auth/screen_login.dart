import 'package:college_sarthi/utils/enums.dart';
import 'package:college_sarthi/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/package_button.dart';
import '../../widgets/package_text_field.dart';
import '../../widgets/widget_auth_bottom_line.dart';
import 'screen_signup.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController controllerUsername = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

  PackageButtonController submitController = PackageButtonController();

  @override
  void initState() {
    super.initState();
    checkAlreadyLoggedIn();
  }

  @override
  void dispose() {
    controllerUsername.dispose();
    controllerPassword.dispose();
    submitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                PackageTextField(
                  hintText: "Student Id",
                  controller: controllerUsername,
                  keyboardType: TextInputType.number,
                ),
                PackageTextField(
                  controller: controllerPassword,
                  hintText: "Password",
                  enumTextfield: EnumTextfield.password,
                ),
                const SizedBox(
                  height: 50,
                ),
                PackageButton(
                  title: "Login",
                  controller: submitController,
                  onPressed: () {
                    submitController.loading!();
                    if (controllerUsername.text != "" &&
                        controllerPassword.text != "") {
                      login().then((value) {
                        submitController.reset!();

                        if (value) {}
                      });
                    } else {
                      submitController.reset!();
                      HFunction.showSnackBar(
                          message: "Please fill all the fields",
                          error: true,
                          context: context);
                    }
                  },
                ),
                WidgetAuthBottomLine(
                    title: "Don't Have an Account?",
                    actionText: "Sign Up",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScreenSignup()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkAlreadyLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    if (token != null) {}
  }

  Future<bool> login() async {
    bool result = false;
    String id = controllerUsername.text.trim();
    String password = controllerPassword.text.trim();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    return result;
  }
}
