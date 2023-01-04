import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bmi(),
    ),
  );
}

Color ATC = Color(0xff3b3c4d);
Color DTC = Color(0xff1d1e33);

Color iATC = Color(0xffeb1555);
Color iDTC = Colors.white;

class bmi extends StatefulWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  double cm = 182;
  int wegiht = 0;
  int age = 0;
  double BMI = 0;

  Color malecolor = DTC;
  Color femalecolor = DTC;

  Color maleiconcolor = iDTC;
  Color femaleiconcolor = iDTC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("BMI Calculator"),
        backgroundColor: Color(0xff090e21),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        updatecolor(1);
                      });
                    },
                    child: Container(
                      height: 180,
                      width: 160,
                      decoration: BoxDecoration(
                        color: femalecolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.female,
                            color: femaleiconcolor,
                            size: 150,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                              color: femaleiconcolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        updatecolor(2);
                      });
                    },
                    child: Container(
                      height: 180,
                      width: 160,
                      decoration: BoxDecoration(
                        color: malecolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.male,
                            color: maleiconcolor,
                            size: 150,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                              color: maleiconcolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xff1d1e33),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      height: 70,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Color(0xff3b3c4d),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "  ${get()} ",
                                style: TextStyle(
                                  color: Colors.green.shade800,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "  ${BMI.toInt()}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "  ${getTOW()}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${cm.toInt()}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: " cm",
                            style: TextStyle(
                              color: Color(0xff626473),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        thumbColor: Color(0xffeb1555),
                        trackHeight: 2,
                      ),
                      child: Slider(
                        activeColor: Color(0xffeb1555),
                        inactiveColor: Colors.white,
                        min: 0,
                        max: 250,
                        value: cm,
                        onChanged: (value) {
                          cm = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Color(0xff1d1e33),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "weight",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$wegiht",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: Color(0xff4c4f5c),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 30,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  wegiht--;
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: Color(0xff6e6f7a),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Color(0xfff67fa4),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  wegiht++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Color(0xff1d1e33),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$age",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: Color(0xff4c4f5c),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 30,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: Color(0xff6e6f7a),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Color(0xfff67fa4),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: 360,
                      height: 75,
                      decoration: BoxDecoration(
                          color: Color(0xffeb1555),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        BMI = wegiht / pow(cm / 100, 2);
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xff090e21),
    );
  }

  void updatecolor(int gender) {
    if (gender == 1) {
      femalecolor = ATC;
      malecolor = DTC;
      femaleiconcolor = iATC;
      maleiconcolor = iDTC;
    } else if (gender == 2) {
      femalecolor = DTC;
      malecolor = ATC;
      femaleiconcolor = iDTC;
      maleiconcolor = iATC;
    }
  }
  get() {
    if (BMI >= 25) {
      return "Overweight";
    } else if (BMI > 18) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  getTOW() {
    if (BMI >= 25) {
      return "You have a higher than Normal body";
    } else if (BMI > 18) {
      return "Good job! You have Normal body";
    } else {
      return "You have a lower than Normal body";
    }
  }

}
