import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SetTimeField extends StatefulWidget {
  SetTimeField({super.key, this.controlleR, this.prefixText});
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController? controlleR;
  String? prefixText;
  @override
  State<SetTimeField> createState() => _SetTimeFieldState();
}

class _SetTimeFieldState extends State<SetTimeField> {
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
          labelStyle: TextStyle(color: Colors.black),
          filled: true,
          prefixIcon: Icon(Icons.punch_clock),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        readOnly: true,
        onTap: () {
          selectTime();
        },
      ),
    );
  }

  Future<void> selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: widget.selectedTime,
    );
    if (picked != null && picked != widget.selectedTime) {
      setState(() {
        //widget.selectedTime = picked;
        //widget.controlleR!.text = picked as String;
        //widget.controlleR!.text = picked.toString().split(" ")[0];
        widget.selectedTime = picked;
        widget.controlleR!.text = widget.selectedTime.format(context).toString();
      });
    }
  }
}
