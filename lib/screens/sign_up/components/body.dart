import 'package:flutter/material.dart';
import 'package:grocery/components/socal_card.dart';
import 'package:grocery/constants.dart';
import 'package:grocery/size_config.dart';
import 'package:provider/src/provider.dart';

import '../../../StateManagement/RegisterSM.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizeConfig.getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: sizeConfig.screenHeight! * 0.04), // 4%
                Text("Register Account", style: headingStyle),
                const Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: sizeConfig.screenHeight! * 0.08),
                SignUpForm(),
                SizedBox(height: sizeConfig.screenHeight! * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                        context.read<RegisterSM>().registerWithGoogle();
                      },
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {
                        context.read<RegisterSM>().registerWithFacebook();
                      },
                    ),
                    // SocalCard(
                    //   icon: "assets/icons/twitter.svg",
                    //   press: () {},
                    // ),
                  ],
                ),
                SizedBox(height: sizeConfig.getProportionateScreenHeight(20)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
