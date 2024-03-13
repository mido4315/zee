import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/components/button_com.dart';
import 'package:flutter_application_1/components/setTimeField_com.dart';
import 'package:flutter_application_1/components/textField_com.dart';

import '../components/setDateField_com.dart';

class AddRemider extends StatefulWidget {
  @override
  State<AddRemider> createState() => _AddRemiderState();
}

class _AddRemiderState extends State<AddRemider> {
  //const AddEscortInfo({super.key});
  TextEditingController IdReminderController = TextEditingController();
  TextEditingController IdPatientController = TextEditingController();
  TextEditingController NameDrugController = TextEditingController();

  TextEditingController StartDateController = TextEditingController();
  TextEditingController StartTimeController = TextEditingController();

  TextEditingController EndDateController = TextEditingController();
  TextEditingController EndTimeController = TextEditingController();

  TextEditingController StateController = TextEditingController();

  TextEditingController AlarmRecordController = TextEditingController();

  TextEditingController AudioController = TextEditingController(); //file

  TextEditingController NotesController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var state = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/add reminder.png'),
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
                height: 130,
              ),
              TextFieldComponent(
                controlleR: IdReminderController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Id Reminder';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Id Reminder';
                  }
                  return null;
                },
                labelText: 'Reminder ID',
                inputType: TextInputType.number,
                preIcon: Icons.numbers,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: IdPatientController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Patien ID ';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Patien ID';
                  }
                  return null;
                },
                labelText: 'Patient ID',
                inputType: TextInputType.number,
                preIcon: Icons.numbers,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: NameDrugController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Name Drug';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Name Drug';
                  }
                  return null;
                },
                labelText: 'Drug Name',
                inputType: TextInputType.name,
                preIcon: Icons.description,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Start Date :',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SetDateField(
                controlleR: StartDateController,
                prefixText: 'Date ',
              ),
              const SizedBox(
                height: 10,
              ),
              SetTimeField(
                controlleR: StartTimeController,
                prefixText: 'Time',
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'End Date :',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SetDateField(
                controlleR: EndDateController,
                prefixText: 'Date ',
              ),
              const SizedBox(
                height: 10,
              ),
              SetTimeField(
                controlleR: EndTimeController,
                prefixText: 'Time',
              ),
              CheckboxListTile(
                title: Text('State'),
                value: state,
                onChanged: (StateController) {
                  setState(() {
                    state = StateController!;
                  });
                },
              ),
              const Text(
                'Alarm Records :',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SetTimeField(
                controlleR: AlarmRecordController,
                prefixText: 'Time',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Audio :',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 85,
                  ),
                  ButtonComponent(
                    () {},
                    buttonName: 'Choose file',
                    buttonWidth: 110,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: NotesController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Notes';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Notes';
                  }
                  return null;
                },
                labelText: 'Notes',
                inputType: TextInputType.text,
                preIcon: Icons.description,
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonComponent(
                () {
                  if (formKey.currentState!.validate()) {
                    print('Go to next step success');
                    print(IdReminderController.text);
                    print(IdPatientController.text);
                    print(NameDrugController.text);
                    print(StartDateController.text);
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
                  child: const Text('Back'))
            ]),
          ),
        ),
      ),
    );
  }
}
