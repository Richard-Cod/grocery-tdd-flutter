import 'package:flutter/material.dart';
import 'package:grocery/components/custom_surfix_icon.dart';
import 'package:grocery/components/form_error.dart';
import 'package:grocery/default_button.dart';
import 'package:grocery/screens/complete_profile/complete_profile_screen.dart';
import 'package:provider/src/provider.dart';

import '../../../StateManagement/RegisterSM.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    final List<String?> errors = context.watch<RegisterSM>().errors;
    final sizeConfig = SizeConfig(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(context),
          SizedBox(height: sizeConfig.getProportionateScreenHeight(30)),
          buildPasswordFormField(context),
          SizedBox(height: sizeConfig.getProportionateScreenHeight(30)),
          buildConformPassFormField(context),
          FormError(errors: errors),
          SizedBox(height: sizeConfig.getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField(BuildContext context) {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          context.read<RegisterSM>().removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          context.read<RegisterSM>().removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          context.read<RegisterSM>().addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          context.read<RegisterSM>().addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField(BuildContext context) {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          context.read<RegisterSM>().removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          context.read<RegisterSM>().removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          context.read<RegisterSM>().addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          context.read<RegisterSM>().addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          context.read<RegisterSM>().removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          context.read<RegisterSM>().removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          context.read<RegisterSM>().addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          context.read<RegisterSM>().addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
