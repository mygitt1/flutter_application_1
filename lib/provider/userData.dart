import 'package:flutter/cupertino.dart';

class UserData with ChangeNotifier {
  String userName;
  String gender;
  String stateName;
  String cityName;

  setName(name) {
    print('$name setting name');
    userName = name;
  }

  setGender(userGender) {
    print('$gender setting gender');

    gender = userGender;

    print(gender);
  }

  setState(state) {
    print('$state setting state');

    stateName = state;
  }

  setCity(city) {
    print('$city setting city');

    cityName = city;
  }
}
