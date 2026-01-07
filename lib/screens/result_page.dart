import 'package:bmi_app/screens/home_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    required this.calculatedBmi,
    required this.rating,
    required this.ratingColor,
    required this.suggestion,

    super.key,
  });

  final String calculatedBmi;
  final String rating;
  final Color ratingColor;
  final String suggestion;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black54,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Center(
                child: Text(
                  'Your Result',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
              SizedBox(height: 30),

              Expanded(
                child: ShadowContainer(
                  width: double.infinity,
                  shadowColor: Colors.black26,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.rating,
                        style: TextStyle(
                          color: widget.ratingColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.calculatedBmi,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.suggestion,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),

              GestureDetector(
                child: CustomButton(
                  buttonText: 'Re-calculate',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
