import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/city_list.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:flutter_application_1/screen/splash_screen.dart';
import 'package:flutter_application_1/screen/state_list.dart';
import 'package:flutter_application_1/provider/userData.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserData(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          StateList.routeName: (ctx) => StateList(),
          CityList.routeName: (ctx) => CityList(),
        },
      ),
    );
  }
}
