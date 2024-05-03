import 'package:flutter/material.dart';

class TrainingDayDetails extends StatefulWidget {
  const TrainingDayDetails({super.key});

  @override
  State<TrainingDayDetails> createState() => _TrainingDayDetailsState();
}

class _TrainingDayDetailsState extends State<TrainingDayDetails> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Column(
        children: [
          Text("Training Day Details Screen"),
        ],
      ),
    );
  }
}