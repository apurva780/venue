import 'package:flutter/material.dart';

import 'login_screen.dart';

class ForgotPassword extends StatefulWidget {

  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? _emailVerification(String? email) {
    if (isEmailValid(email!)) {
      return null;
    } else {
      return "Enter a valid Email address";
    }
  }

  String? _passwordValidation(String? pass) {
    if (pass!.isEmpty) {
      return "Enter Password";
    } else {
      return null;
    }
  }

  String emailRegEx =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  bool isEmailValid(String value) => RegExp(emailRegEx).hasMatch(value);

  void _elevatedBtnLogInOnpress() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          submitForm(),
        ),
      ),
    );
  }

  String submitForm() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
      return "Login Successful";
    } else {
      return "Login failed";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 13,
                        ),
                        const Text(
                          "Forgot password",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                enabled: true,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  // errorText: "Email",
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.email),
                                  hintText: "Email *",
                                  iconColor: Colors.grey,
                                ),
                                validator: _emailVerification,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                onPressed: _elevatedBtnLogInOnpress,
                                child: const SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Change Password",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
