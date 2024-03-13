import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SetDateField extends StatefulWidget {
  SetDateField({super.key, this.controlleR, this.prefixText});

  TextEditingController? controlleR;
  String? prefixText;
  @override
  State<SetDateField> createState() => _SetDateFieldState();
}

class _SetDateFieldState extends State<SetDateField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: widget.controlleR,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixText: widget.prefixText,
          prefixStyle: TextStyle(color: Colors.black),
          filled: true,
          prefixIcon: Icon(Icons.calendar_today),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        readOnly: true,
        onTap: () {
          selectDate();
        },
      ),
    );
  }

  Future<Void?> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        widget.controlleR!.text = picked.toString().split(" ")[0];
      });
    }
  }
}
