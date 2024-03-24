import 'package:flutter/material.dart';

class KTextForm extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final TextInputType? type;
  final bool? isEnabled;
  final bool readOnly;

  const KTextForm({
    super.key,
    required this.controller,
    required this.title,
    this.validator,
    this.type = TextInputType.text,
    this.isEnabled = true,
    this.onTap,
    this.readOnly = false,
  });

  @override
  State<KTextForm> createState() => _KTextFormState();
}

class _KTextFormState extends State<KTextForm> {
  bool isHidden = true;

  bool _isObscureText() {
    if (widget.type == TextInputType.visiblePassword) {
      return isHidden;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      enabled: widget.isEnabled,
      readOnly: widget.readOnly, 
      keyboardType: widget.type,
      validator: widget.validator,
      obscureText: _isObscureText(),
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.title,
        suffixIcon: widget.type == TextInputType.visiblePassword
            ? IconButton(
                splashColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: Icon(
                  isHidden ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}
