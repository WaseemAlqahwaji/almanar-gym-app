import 'package:almanar_application/config/theming/text_style.dart';
import 'package:flutter/material.dart';

class MotivationScreen extends StatelessWidget {
  const MotivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        "Motivation Screen",
        style: TextStyled.font22White600,
      ),
    );
  }
}