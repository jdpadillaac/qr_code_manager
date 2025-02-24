import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';

class QcmTextFormField extends StatelessWidget {
  const QcmTextFormField({
    required this.labelText,
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onFieldSubmitted,
  });

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String labelText;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QcmTitleMedium(labelText, fontWeight: FontWeight.w900),
        QcmVerticalSpacing.sl,
        TextFormField(
          controller: controller,
          validator: validator ?? _customvalidator,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  String? _customvalidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo no puede estar vacio';
    }

    if (keyboardType == TextInputType.emailAddress && !value.contains('@')) {
      return 'Por favor ingrese un correo valido';
    }
    return null;
  }
}

class QcmTextFormObscure extends StatefulWidget {
  const QcmTextFormObscure({
    required this.labelText,
    super.key,
    this.hintText,
    this.controller,
    this.validator,
  });

  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String labelText;

  @override
  State<QcmTextFormObscure> createState() => _QcmTextFormObscureState();
}

class _QcmTextFormObscureState extends State<QcmTextFormObscure> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QcmTitleMedium(widget.labelText, fontWeight: FontWeight.w900),
        QcmVerticalSpacing.sl,
        TextFormField(
          obscureText: _obscureText,
          controller: widget.controller,
          validator:
              widget.validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campo no puede estar vacio';
                }

                return null;
              },
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
        ),
      ],
    );
  }
}

class EmailInputFormatter extends TextInputFormatter {
  final RegExp _emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-@]*$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (_emailRegExp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}
