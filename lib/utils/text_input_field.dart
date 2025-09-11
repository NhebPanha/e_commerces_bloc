import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextInputField extends StatefulWidget {
  final String txt;
  final IconData icons;
  final bool isPassword;
  

  const TextInputField({
    super.key,
    required this.txt,
    required this.icons,
    this.isPassword = false,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool _obscure = true; // controls show/hide

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword; // only obscure if it's a password field
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 350,
      height: 50,
      child: TextFormField(
        obscureText: _obscure,
        enableSuggestions: !widget.isPassword,
        autocorrect: !widget.isPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: widget.txt,
          prefixIcon: Icon(widget.icons, color: Colors.black54),

          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure; // toggle
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
