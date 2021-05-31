import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormModel extends StatefulWidget {
  final String labelText;
  final String errorText;
  final TextEditingController controller;
  final TextInputType textInput;
  final bool obscureText;
  final IconData icon;
  final Function(String) validator;
  final Function(String) onChanged;
  final double width;
  final List<TextInputFormatter> formatter;
  final bool enabled;
  final Color color;

  TextFormModel({
    this.labelText,
    this.errorText,
    this.controller,
    this.textInput,
    this.obscureText,
    this.icon,
    this.validator,
    this.onChanged,
    this.width,
    this.formatter,
    this.enabled,
    this.color,
  });

  @override
  _TextFormModelState createState() => _TextFormModelState();
}

class _TextFormModelState extends State<TextFormModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: EdgeInsets.all(10),
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: widget.color,
          primaryColorDark: widget.color,
        ),
        child: TextFormField(
          enabled: widget.enabled,
          inputFormatters: widget.formatter,
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.color,
                style: BorderStyle.solid,
                width: 3,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: widget.color),
            ),
            labelText: widget.labelText,
            labelStyle: TextStyle(fontFamily: 'Poppins', color: widget.color),
            prefixIcon: Icon(
              widget.icon,
              color: widget.color,
            ),
            prefixText: ' ',
            suffixStyle: TextStyle(color: widget.color, fontFamily: 'Poppins'),
            errorStyle: TextStyle(fontWeight: FontWeight.bold),
            errorText: widget.errorText,
          ),
          keyboardType: TextInputType.emailAddress,
          obscureText: widget.obscureText,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
