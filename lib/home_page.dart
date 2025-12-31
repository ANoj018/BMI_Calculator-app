import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int age = 20;
  int _heightCounter = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        elevation: 5,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      child: ShadowContainer(
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
                                      setState(() {
                                        age++;
                                      });
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
                                      setState(() {
                                        if (age > 0) age--;
                                      });
                                    },
                                    elevation: 10,
                                    fillColor: Colors.white,
                                    shape: CircleBorder(),
                                    constraints: BoxConstraints.tightFor(
                                      width: 45,
                                      height: 45,
                                    ),
                                    child: Icon(
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
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 250,
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
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.man),
                                    iconSize: 60,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.woman),
                                    iconSize: 60,
                                  ),
                                ],
                              ),
                            ),
                            LiteRollingSwitch(
                              onTap: () {},
                              onDoubleTap: () {},
                              onSwipe: () {},
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              ShadowContainer(
                shadowColor: Colors.teal,
                child: Container(
                  height: 250,
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

                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: ListWheelScrollView.useDelegate(
                            itemExtent: 50,
                            useMagnifier: true,
                            magnification: 1.5,
                            childDelegate: ListWheelChildBuilderDelegate(
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
                    ],
                  ),
                ),
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
    super.key,
  });

  final Widget child;
  final Color shadowColor;
  final double? height;

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
      // height: 220,
      width: 400,
      child: Padding(padding: const EdgeInsets.only(top: 30), child: child),
    );
  }
}
