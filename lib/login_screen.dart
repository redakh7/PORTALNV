import 'dart:async';

import 'package:bootstrap_alert/bootstrap_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'auth_service.dart';
import 'cubit/app_states.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }
  late String email, password;
  bool _isObscure = true;
  final formKey = new GlobalKey<FormState>();
  checkFields() {
    final form = formKey.currentState!;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }
  String? validateEmail(String value) {
    if (value != null || value.isNotEmpty) {
      final RegExp regex = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!regex.hasMatch(value))
        return 'Enter a valid email';
      else
        return null;
    } else {
      return 'Enter a valid email';
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final RoundedLoadingButtonController _btnController1 =
        RoundedLoadingButtonController();
    final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
    void _doSomething() async {
      Timer(Duration(seconds: 3), () {
        _btnController.success();
      });
    }
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.blueGrey, Colors.black],
            ),
          ),
          child: Center(
            child: Card(
              elevation: 14,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(55),
                ),
              ),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: size.height *
                    (size.height > 470
                        ? 0.7
                        : size.height > 470
                            ? 0.8
                            : 0.9),
                width: 500,
                color: Colors.white,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Container(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "LOG IN",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                width: 30,
                                child: const Divider(
                                  color: Colors.blueGrey,
                                  thickness: 2,
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              RawKeyboardListener(
                                focusNode: FocusNode(),
                                child: TextFormField(
                                  controller: _emailcontroller,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.black,
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.mail,
                                        color: Colors.green,
                                      ), // icon is 48px widget.
                                    ),
                                    focusColor: Colors.blueGrey,
                                    hoverColor: Colors.blueGrey,
                                    hintText: 'Email',
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Email is required'
                                      : validateEmail(value.trim()),
                                  onChanged: (value) {
                                    this.email = value;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              TextFormField(
                                controller: _passwordcontroller,
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.green,
                                    ), // icon is 48px widget.
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      },);

                                    },
                                  ),
                                ),
                                validator: (value) => value!.isEmpty
                                    ? 'Password is required'
                                    : null,
                                onChanged: (value) {
                                  password = value;
                                },
                              ),
                              SizedBox(
                                height: 64,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                             /* const BootstrapAlert(
                                visible: true,
                                status: AlertStatus.success,
                                leadingIcon: AlertIcons.success,
                                isDismissible: true,
                                text: 'Success Alert with Icon',
                              ),*/
                              ValueListenableBuilder<TextEditingValue>(
                                valueListenable: _passwordcontroller,
                                builder: (context, value, child) {
                                  return ElevatedButton(
                                    onPressed: value.text.isNotEmpty
                                        ? () {
                                            if (checkFields()) {
                                              AuthService()
                                                  .signIn(email, password);
                                            }
                                          }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40.0, vertical: 20.0),
                                      primary: Colors.blueGrey,
                                      shape: const StadiumBorder(),
                                    ),
                                    child: const Text(
                                      "Connect",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  );
                                },
                              ),
                             /* ValueListenableBuilder<TextEditingValue>(
                                valueListenable: _passwordcontroller,
                                builder: (context, value, child) {
                                  return RoundedLoadingButton(
                                    onPressed: value.text.isNotEmpty
                                        ? () {
                                      if (checkFields()) {
                                        AuthService()
                                            .signIn(email, password);
                                      }
                                    }
                                        : null,
                                    controller: _btnController,
                                    child: const Text(
                                      "Connect",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  );
                                },
                              ),*/

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
