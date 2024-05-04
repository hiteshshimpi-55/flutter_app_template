import 'dart:convert';
import 'package:college_sarthi/models/model_dropdown.dart';
import 'package:college_sarthi/utils/color_theme.dart';
import 'package:college_sarthi/utils/helper_functions.dart';
import 'package:college_sarthi/widgets/package_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../utils/enums.dart';
import '../../widgets/package_button.dart';
import '../../widgets/package_text_field.dart';
import '../../widgets/widget_auth_bottom_line.dart';
import 'screen_login.dart';

class ScreenSignup extends StatefulWidget {
  const ScreenSignup({Key? key}) : super(key: key);

  @override
  State<ScreenSignup> createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenSignup> {
  TextEditingController studentIdController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ModelDropdown? college;
  ModelDropdown? department;

  bool loading = false;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: (loading)
                ? const CircularProgressIndicator(
                    color: ColorTheme.primary,
                    strokeWidth: 4,
                  )
                : SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          PackageTextField(
                            hintText: "Student Id",
                            controller: studentIdController,
                            keyboardType: TextInputType.number,
                          ),
                          PackageTextField(
                            hintText: "First Name",
                            controller: firstNameController,
                          ),
                          PackageTextField(
                            hintText: "Last Name",
                            controller: lastNameController,
                          ),
                          PackageTextField(
                            hintText: "Select College",
                            controller: collegeController,
                            enumTextfield: EnumTextfield.dropdown,
                            onTap: () {
                              // DropDown.openDropDown(
                              //     context: context,
                              //     title: "College",
                              //     api: DropDownItem.college.value,
                              //     onSelect: (value) {
                              //       college = value;
                              //       collegeController.text =
                              //           college!.shortName!;
                              //     });
                            },
                          ),
                          PackageTextField(
                            hintText: "Select Department",
                            controller: departmentController,
                            enumTextfield: EnumTextfield.dropdown,
                            onTap: () {
                              // DropDown.openDropDown(
                              //     context: context,
                              //     title: "Department",
                              //     api: DropDownItem.department.value,
                              //     onSelect: (value) {
                              //       department = value;
                              //       departmentController.text =
                              //           department!.shortName!;
                              //     });
                            },
                          ),
                          PackageTextField(
                            hintText: "Mobile Number",
                            controller: mobileNumberController,
                            keyboardType: TextInputType.number,
                            maxChar: 10,
                          ),
                          PackageTextField(
                            hintText: "Password",
                            controller: passwordController,
                            enumTextfield: EnumTextfield.password,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PackageButton(
                            title: "Sign Up",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                // Signin
                              } else {
                                HFunction.showSnackBar(
                                    message: "Please fill all the fields",
                                    error: true,
                                    context: context);
                              }
                            },
                          ),
                          WidgetAuthBottomLine(
                              title: "Already Have an Account?",
                              actionText: "Login",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ScreenLogin()));
                              }),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Future<bool> signUp() async {
    bool result = false;

    return result;
  }
}
