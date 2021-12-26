import 'package:flutter/material.dart';
import 'package:grocery/StateManagement/RegisterSM.dart';
import 'package:grocery/components/custom_surfix_icon.dart';
import 'package:grocery/components/form_error.dart';
import 'package:grocery/helper/keyboard.dart';
import 'package:grocery/screens/forgot_password/forgot_password_screen.dart';
import 'package:grocery/screens/login_success/login_success_screen.dart';
import 'package:provider/src/provider.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);

    final List<String?> errors = context.watch<RegisterSM>().errors;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(context),
          SizedBox(height: sizeConfig.getProportionateScreenHeight(30)),
          buildPasswordFormField(context),
          SizedBox(height: sizeConfig.getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: sizeConfig.getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
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
        return null;
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
          // context.read<RegisterSM>().addError(error: kEmailNullError);
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
