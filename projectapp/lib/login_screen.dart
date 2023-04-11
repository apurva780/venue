import 'package:flutter/material.dart';

import 'forgot_password.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          builder: (context) => const HomeScreen(),
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
                          "Login",
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
                              TextFormField(
                                // controller: rePassCnt,
                                obscureText: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                enabled: true,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  errorText: "Incorrect password",
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.password,
                                  ),
                                  hintText: "Password *",
                                  iconColor: Colors.grey,
                                ),
                                // validator: _passwordValidation,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(onPressed: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPassword()));

                                  }, child: Text("Forget password?",style:TextStyle(color:Colors.blue,decoration: TextDecoration.underline,fontSize:16))),//RichText(text: TextSpan(text: "Forget password?",style: TextStyle(color:Colors.blue)),),),
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              ElevatedButton(
                                onPressed: _elevatedBtnLogInOnpress,
                                child: const SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Login",
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
