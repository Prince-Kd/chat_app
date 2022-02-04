import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  dynamic obscure;
  final String label;
  final String? hint;
  final bool? suffix;
  final handleChange;
  final prefix;
  final validation;
  TextInputWidget({
    Key? key,
    this.obscure = false,
    required this.label,
    this.hint,
    this.suffix,
    this.prefix,
    this.validation,
    this.handleChange,
  }) : super(key: key);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        validator: widget.validation,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.handleChange,
        obscureText: widget.obscure ?? false,
        decoration: InputDecoration(
          label: Text(widget.label),
          hintText: widget.hint ?? '',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: Icon(widget.prefix, color: Colors.deepPurpleAccent ),
          suffixIcon: widget.suffix != null ? IconButton(
            onPressed: () {
              setState(() {
                widget.obscure = !widget.obscure;
              });
            },
            icon:
                Icon(widget.obscure ? Icons.visibility_off : Icons.visibility),
          ) : null,
        ),
      ),
    );
  }
}
