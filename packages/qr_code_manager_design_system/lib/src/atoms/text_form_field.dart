import 'package:flutter/material.dart';

class QcmTextFormField extends StatelessWidget {
  const QcmTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
  });

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class QcmTextFormObscure extends StatefulWidget {
  const QcmTextFormObscure({super.key, this.hintText, this.controller});

  final String? hintText;
  final TextEditingController? controller;

  @override
  State<QcmTextFormObscure> createState() => _QcmTextFormObscureState();
}

class _QcmTextFormObscureState extends State<QcmTextFormObscure> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      controller: widget.controller,

      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          color: Colors.white,
          icon:
              _obscureText
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
