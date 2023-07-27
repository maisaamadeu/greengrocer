import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget(
      {super.key,
      required this.label,
      required this.icon,
      required this.isSecret,
      required this.controller,
      required this.hintText,
      this.autoCorrect = false,
      this.formatter,
      this.maxLength = 999,
      this.keyboardType = TextInputType.text,
      this.isReadOnly = false,
      this.hasErrorController = false,
      this.errorMessage = '',
      this.hasError = false});

  final String label;
  final IconData icon;
  final bool isSecret;
  final TextEditingController controller;
  final String hintText;
  final bool autoCorrect;
  final dynamic formatter;
  final int maxLength;
  final TextInputType keyboardType;
  final bool isReadOnly;
  final bool hasErrorController;
  final bool hasError;
  final String errorMessage;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool isObscure = false;

  @override
  void initState() {
    isObscure = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        readOnly: widget.isReadOnly,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: isObscure,
        autocorrect: widget.autoCorrect,
        decoration: InputDecoration(
          errorText: widget.hasErrorController
              ? widget.hasError
                  ? widget.errorMessage
                  : null
              : null,
          counterText: '',
          hintText: widget.hintText,
          label: Text(widget.label),
          prefixIcon: Icon(
            widget.icon,
            size: 24,
          ),
          suffixIcon: widget.isSecret
              ? IconButton(
                  icon: Icon(
                      !isObscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  iconSize: 24,
                )
              : null,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        inputFormatters: widget.formatter != null ? [widget.formatter!] : [],
        maxLength: widget.maxLength,
      ),
    );
  }
}
