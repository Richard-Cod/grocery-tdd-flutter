import 'package:flutter/material.dart';
import 'package:grocery/StateManagement/CartSM.dart';
import 'package:grocery/StateManagement/HomeSM.dart';
import 'package:grocery/StateManagement/RegisterSM.dart';
import 'package:grocery/routes.dart';
import 'package:grocery/screens/home/home_screen.dart';
import 'package:grocery/screens/otp/otp_screen.dart';
import 'package:grocery/screens/sign_in/sign_in_screen.dart';
import 'package:grocery/screens/sign_up/sign_up_screen.dart';
import 'package:grocery/screens/splash/splash_screen.dart';
import 'package:grocery/theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeSM()),
        ChangeNotifierProvider(create: (_) => CartSM()),
        ChangeNotifierProvider(create: (_) => RegisterSM()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Grocery',
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
