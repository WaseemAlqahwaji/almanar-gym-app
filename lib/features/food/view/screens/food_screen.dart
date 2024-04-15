import 'package:almanar_application/config/theming/text_style.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Food Screen",
        style: TextStyled.font16White700,
      ),
    );
  }
}
