import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/userData.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool isInit = true;
  var name;
  var state;
  var city;
  var gender;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      city = Provider.of<UserData>(context, listen: false).cityName;
      name = Provider.of<UserData>(context, listen: false).userName;
      state = Provider.of<UserData>(context, listen: false).stateName;
      gender = Provider.of<UserData>(context, listen: false).gender;
      print('in userinfo');
      print(gender);
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Info'),
        ),
        body: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: gender == 'Male'
                    ? Text(
                        'Dear, Mr $name, you are from $city in $state, India.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    : Text(
                        'Dear, M/s $name, you are from $city in $state, India.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomeScreen.routeName);
                  },
                  child: Text('Home Screen'))
            ],
          ),
        ));
  }
}
