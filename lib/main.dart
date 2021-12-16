import 'package:flutter/material.dart';
import 'package:grocery/routes.dart';
import 'package:grocery/screens/home/home_screen.dart';
import 'package:grocery/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
