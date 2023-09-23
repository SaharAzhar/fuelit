import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fuelit_pilot/components/no_account_text.dart';
import 'package:fuelit_pilot/components/social_card.dart';
import 'package:fuelit_pilot/constants.dart';
import 'package:fuelit_pilot/size_config.dart';

import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
              AnimatedTextKit(
                  pause: Duration(seconds: 5),
                  totalRepeatCount: 1,
                  animatedTexts: [
                  TypewriterAnimatedText('Authenticate', textStyle: headingStyle,speed: Duration(milliseconds: 2000), cursor:'.',
                  curve: Curves.fastLinearToSlowEaseIn),
              ],
            ),
                Text(
                  "Sign into FUELit with your credentials",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text(
                  "------ OR ------",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SocialCard
                  (
                    icon: "assets/icons/google-icon.svg",
                    press: ()  {},
                  ),
                  SocialCard
                  (
                    icon: "assets/icons/facebook-2.svg",
                    press: ()  {},
                  ),
                  SocialCard
                  (
                    icon: "assets/icons/apple.svg",
                    press: ()  {},
                  ),
              ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

