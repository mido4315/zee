import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button_com.dart';
import 'package:flutter_application_1/components/textField_com.dart';
import '../api/api_service.dart';
import '../api/register/auth_repo_impl.dart';
import 'add_screen.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //const RegisterScreen({ Key key }) : super(key: key);
  TextEditingController UserNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController passwardController = TextEditingController();

  TextEditingController repeatPasswardController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var isPassward = true;

  void registerNewUser() {
    AuthRepoImpl authRepo = AuthRepoImpl(APIService(Dio()));
    authRepo.userRegister(
      name: "mohamedmohamed",
      email: "mohameddsds2002sayed@gmail.com",
      password: "1234123412341234",
      RePassword: "1234123412341234",
      PhoneNumber: "01019741210",
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/signup.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 125,
                  ),
                  Text(
                    'Register Now',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldComponent(
                controlleR: UserNameController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your User Name';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid User Name';
                  }
                  return null;
                },
                labelText: 'User Name',
                inputType: TextInputType.name,
                preIcon: Icons.person,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: EmailController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Email';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Email';
                  }
                  return null;
                },
                labelText: 'Email',
                inputType: TextInputType.emailAddress,
                preIcon: Icons.email,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: passwardController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Passward';
                  } else if (value.length < 8) {
                    return 'The Password Should be at least 8 Letters';
                  }
                  return null;
                },
                isPassward: isPassward,
                labelText: 'Passward',
                inputType: TextInputType.visiblePassword,
                preIcon: Icons.lock,
                sufIcon: isPassward ? Icons.visibility_off : Icons.visibility,
                sufIconPressed: () {
                  setState(() {
                    isPassward = !isPassward;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: repeatPasswardController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please repeat your Passward correctly';
                  } else if (value != passwardController.text) {
                    return 'The Password doesn\'t match';
                  } else if (value.length < 8) {
                    return 'The Password Should be at least 8 Letters';
                  }
                  return null;
                },
                isPassward: isPassward,
                labelText: 'Repeat Passward',
                inputType: TextInputType.visiblePassword,
                preIcon: Icons.lock,
                sufIcon: isPassward ? Icons.visibility_off : Icons.visibility,
                sufIconPressed: () {
                  setState(() {
                    isPassward = !isPassward;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: PhoneController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Phone';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Phone';
                  }
                  return null;
                },
                labelText: 'PhoneNumber',
                inputType: TextInputType.phone,
                preIcon: Icons.phone,
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonComponent(
                () {

                  // if (formKey.currentState!.validate()) {
                    print('Register successsuccesssuccess');
                    registerNewUser();
                    print('Register success');
                    print(UserNameController.text);
                    print(passwardController.text);
                    print(repeatPasswardController.text);
                    print(PhoneController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return AddScreen();
                    })));
                  //}
                },
                buttonName: 'Register',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('already have an account?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      print('Rs');
                    },
                    child: const Text(
                      ' Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}