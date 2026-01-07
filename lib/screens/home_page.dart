import 'package:bmi_app/bmi_calculator.dart';
import 'package:bmi_app/result_page.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int age = 20;
  final _heightCounter = 50;
  double weight = 50;
  int height = 120;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black54,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                // flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ShadowContainer(
                        // height: 250,
                        shadowColor: Colors.greenAccent,
                        child: Column(
                          children: [
                            Text(
                              'Age',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              age.toString(),
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Row(
                                children: [
                                  RawMaterialButton(
                                    onPressed: () {
                                      age >= 100 ? age = 100 : age++;

                                      setState(() {});
                                    },
                                    elevation: 10,
                                    fillColor: Colors.white,
                                    shape: CircleBorder(),
                                    constraints: BoxConstraints.tightFor(
                                      width: 45,
                                      height: 45,
                                    ),

                                    child: Icon(Icons.add, color: Colors.blue),
                                  ),
                                  SizedBox(width: 10),
                                  RawMaterialButton(
                                    onPressed: () {
                                      age <= 1 ? age = 1 : age--;
                                      setState(() {
                                        ;
                                      });
                                    },
                                    elevation: 10,
                                    fillColor: Colors.white,
                                    shape: CircleBorder(),
                                    constraints: BoxConstraints.tightFor(
                                      width: 45,
                                      height: 45,
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        // height: 250,
                        child: ShadowContainer(
                          shadowColor: Colors.purpleAccent,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isMale = true;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.man,
                                        color: isMale
                                            ? Colors.blue
                                            : Colors.grey,
                                      ),
                                      iconSize: 60,
                                    ),

                                    // FEMALE ICON
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isMale = false;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.woman,
                                        color: isMale
                                            ? Colors.grey
                                            : Colors.pink,
                                      ),
                                      iconSize: 60,
                                    ),
                                  ],
                                ),
                              ),

                              LiteRollingSwitch(
                                value: isMale,
                                textOn: 'Male',
                                textOff: 'Female',
                                iconOn: Icons.male,
                                iconOff: Icons.female,
                                colorOn: Colors.blue,
                                colorOff: Colors.pink,
                                onTap: () {},
                                onDoubleTap: () {},
                                onSwipe: () {},
                                onChanged: (bool value) {
                                  setState(() {
                                    isMale = value;
                                  });
                                },
                              ),

                              // LiteRollingSwitch(
                              //   onTap: () {},
                              //   onDoubleTap: () {},
                              //   onSwipe: () {},
                              //   onChanged: (value) {},
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                // flex: 2,
                child: ShadowContainer(
                  shadowColor: Colors.teal,
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Height  ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            TextSpan(
                              text: 'cm',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 2,
                        child: Image.asset('assets/images/meter_icon.png'),
                      ),

                      Expanded(
                        child: Container(
                          // height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: ListWheelScrollView.useDelegate(
                              physics: FixedExtentScrollPhysics(),
                              onSelectedItemChanged: (val) {
                                height = val;
                              },
                              itemExtent: 50,
                              useMagnifier: true,
                              magnification: 1.5,
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 150,
                                builder: (context, index) {
                                  return RotatedBox(
                                    quarterTurns: 1,
                                    child: Text(
                                      '${_heightCounter + index}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: ShadowContainer(
                  width: double.infinity,
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Weigth  ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            TextSpan(
                              text: 'kg',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        weight.toStringAsFixed(2),
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 28,
                        ),
                      ),
                      Slider(
                        max: 150,
                        min: 20,
                        value: weight,
                        onChanged: (val) {
                          weight = val;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),

              CustomButton(
                buttonText: 'Calculate',
                onTap: () {
                  // calculate BMI
                  var bmiCalculator = BmiCalculator(
                    height: height,
                    weight: weight.toInt(),
                  );

                  var calculatedBmi = bmiCalculator.calculateBmi();
                  // print(bmiCalculator.bmi);

                  String rating = bmiCalculator.getRating();
                  print(rating);

                  Color ratingColor = bmiCalculator.getColor();
                  print(ratingColor);

                  String suggestion = bmiCalculator.getSuggestion();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        calculatedBmi: bmiCalculator.bmi.toStringAsFixed(1),
                        rating: rating,
                        ratingColor: ratingColor,
                        suggestion: suggestion,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    required this.child,
    this.shadowColor = Colors.red,
    this.height,
    this.width,
    super.key,
  });

  final Widget child;
  final Color shadowColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: shadowColor, offset: Offset(5, 5), blurRadius: 5),
        ],
        color: Colors.white,
      ),
      height: height,
      width: width,
      child: Padding(padding: const EdgeInsets.only(top: 30), child: child),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({required this.buttonText, this.onTap, super.key});

  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: Center(
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
