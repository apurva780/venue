import 'package:flutter/material.dart';

import 'forgot_password.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int place = 0;

  String? _emailVerification(String? email) {
    if (isEmailValid(email!)) {
      return null;
    } else {
      return "Wrong Email address";
    }
  }

  String emailRegEx =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  bool isEmailValid(String value) => RegExp(emailRegEx).hasMatch(value);

  String? _nameValidation(String? name) {
    if (name!.isEmpty) {
      return "Enter Name";
    } else {
      return null;
    }
  }

  String? _addressLine(String? address) {
    if (address!.isEmpty) {
      return "Enter Address";
    } else {
      return null;
    }
  }

  String? _stateValidation(String? state) {
    if (state!.isEmpty) {
      return "Enter State";
    } else {
      return null;
    }
  }

  String? _cityValidation(String? city) {
    if (city!.isEmpty) {
      return "Enter City";
    } else {
      return null;
    }
  }

  String? _zipCodeValidation(String? zipCode) {
    if (zipCode!.isEmpty) {
      return "Enter Zipcode";
    } else {
      return null;
    }
  }

  String? _numberVerification(String? number) {
    if (isNumberValid(number!)) {
      return null;
    } else {
      return "Enter valid number";
    }
  }

  bool isNumberValid(String value) => RegExp(phoneRedEx).hasMatch(value);

  String phoneRedEx = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  String? _passwordVerification(String? pass) {
    if (pass!.isNotEmpty) {
      return null;
    } else {
      return "Enter Password";
    }
  }

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();

  TextEditingController addressLine1 = TextEditingController();
  TextEditingController addressLine2 = TextEditingController();

  TextEditingController stateCnt = TextEditingController();
  TextEditingController cityCnt = TextEditingController();
  TextEditingController zipCodeCnt = TextEditingController();

  TextEditingController emailCnt = TextEditingController();
  TextEditingController mobCnt = TextEditingController();
  TextEditingController passCnt = TextEditingController();
  TextEditingController rePassCnt = TextEditingController();

  GlobalKey<FormState> formKey1 = GlobalKey();
  GlobalKey<FormState> formKey2 = GlobalKey();
  GlobalKey<FormState> formKey3 = GlobalKey();
  GlobalKey<FormState> formKey4 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    height: 130,
                    width: 130,
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
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 4; i++) ...[
                                Container(
                                  color: i == place ? Colors.blue : Colors.grey,
                                  width: 18,
                                  height: 3,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          if (place < 4)
                            Row(
                              children: const [
                                Text(
                                  "Field with",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  " * ",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  " are required",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          else
                            const Text("Emergency contact details "),
                          const SizedBox(
                            height: 13,
                          ),
                          if (place == 0)
                            Form(
                              key: formKey1,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: fName,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    enabled: true,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      // errorText: "Enter First name",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.person_2_outlined,
                                      ),
                                      hintText: "First Name *",
                                      iconColor: Colors.grey,
                                    ),
                                    validator: _nameValidation,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: lName,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    enabled: true,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.person_2_outlined,
                                      ),
                                      hintText: "Last Name *",
                                      iconColor: Colors.grey,
                                    ),
                                    validator: _nameValidation,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: addressLine1,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    enabled: true,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.signpost_outlined,
                                      ),
                                      hintText: "Address Line1 *",
                                      iconColor: Colors.grey,
                                    ),
                                    validator: _addressLine,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: addressLine2,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    enabled: true,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.signpost_outlined,
                                      ),
                                      hintText: "Address Line2 *",
                                      iconColor: Colors.grey,
                                    ),
                                    validator: _addressLine,
                                  ),
                                ],
                              ),
                            )
                          else if (place == 1)
                            Form(
                              key: formKey2,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: stateCnt,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    enabled: true,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.signpost_outlined,
                                      ),
                                      hintText: "State *",
                                      iconColor: Colors.grey,
                                    ),
                                    validator: _stateValidation,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: cityCnt,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    enabled: true,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.signpost_outlined,
                                      ),
                                      hintText: "City *",
                                      iconColor: Colors.grey,
                                    ),
                                    validator: _cityValidation,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: zipCodeCnt,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    enabled: true,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.person_pin_circle_outlined,
                                      ),
                                      hintText: "ZipCode *",
                                      iconColor: Colors.grey,
                                    ),
                                    validator: _zipCodeValidation,
                                  ),
                                ],
                              ),
                            )
                          else if (place == 2)
                            Form(
                              key: formKey3,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: emailCnt,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    enabled: true,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      // errorText: "Enter Email",
                                      // errorText: "Enter valid email",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.email,
                                      ),
                                      hintText: "Email *",
                                      iconColor: Colors.grey,
                                    ),
                                    // validator: _emailVerification,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: mobCnt,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    enabled: true,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      // errorText: "Enter Mobile number",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.phone,
                                      ),
                                      hintText: "Mobile number *",
                                      iconColor: Colors.grey,
                                    ),
                                    validator: _numberVerification,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: passCnt,
                                    obscureText: true,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    enabled: true,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      // errorText: "Enter Password",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.email,
                                      ),
                                      hintText: "Password *",
                                      iconColor: Colors.grey,
                                    ),
                                    validator: _passwordVerification,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: rePassCnt,
                                    obscureText: true,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    enabled: true,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      // errorText: "Password not matched",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.email,
                                      ),
                                      hintText: "Confirm Password *",
                                      iconColor: Colors.grey,
                                    ),
                                    validator: _passwordVerification,
                                  ),
                                ],
                              ),
                            ),
                          const Spacer(),
                          Row(
                            children: [
                              if (place != 0) ...[
                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        fixedSize: const Size(30, 45)),
                                    child: const Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.black,
                                        size: 20),
                                    onPressed: () {
                                      setState(() {
                                        place--;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                              Expanded(
                                flex: 3,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    fixedSize: const Size(30, 45),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (place == 0) {}
                                      if (place == 2) {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen(),
                                        ));
                                      } else {
                                        if (place < 3) {
                                          place++;
                                        }
                                      }
                                    });
                                  },
                                  child: const Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
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
      ),
    );
  }
}
