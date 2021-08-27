import 'package:flutter/material.dart';

class TracktionInput extends StatelessWidget {
  final String initialValue;
  final String hint;
  final int maxlines;
  final String Function(String) validator;
  final Function(String) change;
  final TextEditingController controller;
  final int maxLength;
  final bool autoFocus;
  final Color errorColor;
  final TextAlign align;
  final TextInputType keyboardType;

  TracktionInput(
      {this.initialValue,
      this.hint,
      this.errorColor = Colors.red,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.align = TextAlign.start,
      this.maxlines = 1,
      this.validator,
      this.change,
      this.autoFocus = false,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
          validator: validator,
          initialValue: initialValue,
          controller: controller,
          maxLines: maxlines,
          onChanged: change,
          onFieldSubmitted: change,
          autofocus: autoFocus,
          onSaved: change,
          textAlign: align,
          maxLength: maxLength,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              isCollapsed: true,
              errorStyle: TextStyle(color: errorColor, fontSize: 14),
              fillColor: Colors.white,
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              hintText: hint)),
    );
  }
}
