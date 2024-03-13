import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/components/button_com.dart';
import 'package:flutter_application_1/components/textField_com.dart';

import 'addDiseases.dart';
import 'addEcortInfo_screen.dart';
import 'addMoreInfo.dart';

class AddPatientInfo extends StatefulWidget {
  @override
  State<AddPatientInfo> createState() => _AddPatientInfoState();
}

class _AddPatientInfoState extends State<AddPatientInfo> {
  //const AddEscortInfo({super.key});
  TextEditingController FirstController = TextEditingController();
  TextEditingController LastController = TextEditingController();
  TextEditingController IdPatientController = TextEditingController();
  TextEditingController IdDiseaseController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController passwardController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController HandelController = TextEditingController();
  TextEditingController ImageController = TextEditingController();

  //TextEditingController IsMaleController = TextEditingController();
  //TextEditingController IsFemaleController = TextEditingController();
  final url =
      Uri.parse('http://web-production-df187.up.railway.app/erd/patient/');
  // Replace with your Django backend URL

  var formKey = GlobalKey<FormState>();

  var isPassward = true;
  var isMale = false;
  var isFemale = false;
  Image? imgEscort;

  Future<http.Response> addPatientInfo() async {
    final Map<String, dynamic> requestBody = {
      'first_name': FirstController.text,
      'last_name': LastController.text,
      'patient_id': IdPatientController.text,
      'email': EmailController.text,
      'password': passwardController.text,
      'phone_number': PhoneController.text,
      'user_name': HandelController.text,
      'is_male': isMale,
      'is_female': isFemale,
    };

    // try {
    var response = await http.post(
      url,
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      // Successful addition of patient information, handle the response accordingly
      print('Patient information added successfully');
      print('Response: ${response.body}');
    } else {
      // Handle failure to add patient information
      print('Failed to add patient information');
      print('Error: ${response.body}');
    }
    return response;
    // }
    // catch (error) {
    //   // Handle network or other errors
    //   print('Error: $error');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/add patient.png'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            key: formKey,
            child: ListView(children: [
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                  onTap: (() {}),
                  child: CircleAvatar(
                    radius: 25,
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: FirstController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your User Name';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid First Name';
                  }
                  return null;
                },
                labelText: 'First Name',
                inputType: TextInputType.name,
                preIcon: Icons.verified,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: LastController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your User Name';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Last Name';
                  }
                  return null;
                },
                labelText: 'Last Name',
                inputType: TextInputType.name,
                preIcon: Icons.verified,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: IdPatientController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your ID ';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid ID';
                  }
                  return null;
                },
                labelText: 'PatientID',
                inputType: TextInputType.number,
                preIcon: Icons.numbers,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: IdDiseaseController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Id Disease';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Id Disease';
                  }
                  return null;
                },
                labelText: 'Disease ID',
                inputType: TextInputType.number,
                preIcon: Icons.numbers,
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
              TextFieldComponent(
                controlleR: HandelController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Handel';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Handel';
                  }
                  return null;
                },
                labelText: 'Handel',
                inputType: TextInputType.name,
                preIcon: Icons.description,
              ),
              CheckboxListTile(
                title: Text('Male'),
                value: isMale,
                onChanged: (newbool) {
                  setState(() {
                    isMale = newbool!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Female'),
                value: isFemale,
                onChanged: (newbool1) {
                  setState(() {
                    isFemale = newbool1!;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonComponent(
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return AddMoreInfo();
                      })));
                    },
                    buttonWidth: 165,
                    buttonName: 'Add More Info',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ButtonComponent(
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return AddEscortInfo();
                      })));
                    },
                    buttonWidth: 165,
                    buttonName: 'Add Escort',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ButtonComponent(
                () async {
                  if (formKey.currentState!.validate()) {
                    print('Go to next step success');
                    print(FirstController.text);
                    print(LastController.text);
                    print(IdPatientController.text);
                    print(EmailController.text);
                    print(passwardController.text);
                    print(PhoneController.text);
                    print(HandelController.text);
                    http.Response res = await addPatientInfo();
                    print(res.body + "data");

                    // Navigator.push(context,
                    // MaterialPageRoute(builder: ((context) {
                    // return AddScreen();
                    // })));
                  }
                },
                buttonName: 'Add',
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'))
            ]),
          ),
        ),
      ),
    );
  }
}
