// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fuelit_pilot/constants.dart';
import 'package:fuelit_pilot/screens/sign_in/sign_in_screen.dart';
import 'package:fuelit_pilot/size_config.dart';
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Low fuel should not be a concern in your trip.",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We are there for you anywhere.",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We are glad to have you on board.",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 5,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"]!,
                    text: splashData[index]['text']!,
                  ),
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(flex: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex:5),
                    DefaultButton(
                      text: "⚡ Let's Authenticate ⚡",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(flex: 5),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 6),
      height: 25,
      width: currentPage == index ? 80 : 30,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 189, 129, 129),
            blurRadius: 60,
            spreadRadius: 0.5,
            offset: Offset(4,4)
          )
        ],
        color: currentPage == index
            ? kPrimaryColor
            : Color.fromARGB(255, 255, 174, 174),
        borderRadius: BorderRadius.circular(9),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child:ElevatedButton(
        style: ElevatedButton.styleFrom(
           elevation: 15,
     
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: kPrimaryColor,

        ),
        onPressed: press, child:  Text(
          text,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(18), color: Colors.white),
        ),)
      
 
    );
  }
}
