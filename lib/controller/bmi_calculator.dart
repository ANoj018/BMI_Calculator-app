import 'dart:math';

import 'package:flutter/material.dart';

class BmiCalculator {
  BmiCalculator({required this.height, required this.weight});

  final int height; // in cm
  final int weight; // in kg
  late double bmi;

  double calculateBmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi;
  }

  String getRating() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  Color getColor() {
    if (bmi >= 25) {
      return Colors.red;
    } else if (bmi >= 18.5) {
      return Colors.green;
    } else {
      return Colors.orange;
    }
  }

  String getSuggestion() {
    if (bmi >= 25) {
      return 'You are slightly overweight. Regular exercise is recommended.';
    } else if (bmi >= 18.5) {
      return 'Great job! You have a normal body weight.';
    } else {
      return 'You are underweight. A balanced diet is recommended.';
    }
  }
}
