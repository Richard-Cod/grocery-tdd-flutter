import 'package:flutter/material.dart';
import 'package:grocery/default_button.dart';
import 'package:grocery/screens/home/home_screen.dart';
import 'package:grocery/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);

    return Column(
      children: [
        SizedBox(height: sizeConfig.screenHeight! * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: sizeConfig.screenHeight! * 0.4, //40%
        ),
        SizedBox(height: sizeConfig.screenHeight! * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: sizeConfig.getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: sizeConfig.screenWidth! * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
