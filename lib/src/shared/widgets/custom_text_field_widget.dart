import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget(
      {super.key,
      required this.label,
      required this.icon,
      required this.isSecret,
      required this.controller});

  final String label;
  final IconData icon;
  final bool isSecret;
  final TextEditingController controller;

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
        controller: widget.controller,
        obscureText: isObscure,
        decoration: InputDecoration(
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
      ),
    );
  }
}
