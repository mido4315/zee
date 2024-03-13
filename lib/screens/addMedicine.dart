import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/components/button_com.dart';
import 'package:flutter_application_1/components/setTimeField_com.dart';
import 'package:flutter_application_1/components/textField_com.dart';

import '../components/setDateField_com.dart';

class AddMedicine extends StatefulWidget {
  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  //const AddEscortInfo({super.key});
  TextEditingController IdDrugController = TextEditingController();
  TextEditingController NameDrugController = TextEditingController();
  TextEditingController PurposeOfUseController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController(); //file

  TextEditingController DurationDateController = TextEditingController();
  TextEditingController DurationTimeController = TextEditingController();

  TextEditingController NumberOfTimesDayController = TextEditingController();
  TextEditingController TypeOfMedicineController = TextEditingController();

  TextEditingController ExpireDateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/add medicine.png'),
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
                controlleR: IdDrugController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Id Drug';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Id Drug';
                  }
                  return null;
                },
                labelText: 'Drug ID',
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
                preIcon: Icons.person,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: PurposeOfUseController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter PurposeOfUse';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid PurposeOfUse';
                  }
                  return null;
                },
                labelText: 'Purpose Of Use',
                inputType: TextInputType.text,
                preIcon: Icons.description,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: DescriptionController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Description';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Description';
                  }
                  return null;
                },
                labelText: 'Description',
                inputType: TextInputType.text,
                preIcon: Icons.description,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Duration of use :',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SetDateField(
                controlleR: DurationDateController,
                prefixText: 'Date ',
              ),
              const SizedBox(
                height: 10,
              ),
              SetTimeField(
                controlleR: DurationTimeController,
                prefixText: 'Time',
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: NumberOfTimesDayController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter NumberOfTimesDay';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid NumberOfTimesDay';
                  }
                  return null;
                },
                labelText: 'Number Of Times Day',
                inputType: TextInputType.number,
                preIcon: Icons.numbers,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: TypeOfMedicineController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter TypeOfMedicine';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid TypeOfMedicine';
                  }
                  return null;
                },
                labelText: 'Type Of Medicine',
                inputType: TextInputType.text,
                preIcon: Icons.description,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Expire date :',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SetDateField(
                controlleR: ExpireDateController,
                prefixText: 'Date ',
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonComponent(
                () {
                  if (formKey.currentState!.validate()) {
                    print('Go to next step success');
                    print(IdDrugController.text);
                    print(NameDrugController.text);
                    print(PurposeOfUseController.text);
                    print(DescriptionController.text);
                    print(NumberOfTimesDayController.text);
                    print(TypeOfMedicineController.text);
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
