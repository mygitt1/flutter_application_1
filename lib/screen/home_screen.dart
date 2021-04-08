import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/get_api.dart';
import 'package:flutter_application_1/provider/userData.dart';
import 'package:flutter_application_1/screen/state_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<HomeScreen> {
  final _formkey = GlobalKey<FormState>();
  GetApi getApi = GetApi();

  String genderSelection = '';

  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Project'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Select your Gender',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RadioListTile(
                      // selectedTileColor: Theme.of(context).accentColor,
                      value: 'Male',
                      title: Text('Male'),
                      groupValue: genderSelection,
                      onChanged: (newVal) {
                        setState(() {
                          genderSelection = newVal;
                        });
                      }),
                  RadioListTile(
                      value: 'Female',
                      title: Text('Female'),
                      groupValue: genderSelection,
                      onChanged: (newVal) {
                        setState(() {
                          genderSelection = newVal;
                        });
                      }),
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),

              RaisedButton(
                onPressed: () {
                  // print('In Home screen');
                  // print(nameController.text);
                  // print(genderSelection);

                  // conditional check for name and gender
                  if (nameController.text.isEmpty ||
                      nameController.text == null ||
                      genderSelection.isEmpty ||
                      genderSelection == null) {
                    return null;
                  } else {
                    Provider.of<UserData>(context, listen: false)
                        .setName(nameController.text);
                    Provider.of<UserData>(context, listen: false)
                        .setGender(genderSelection);
                  }
                  // saving user name data into provider
                  Provider.of<UserData>(context, listen: false)
                      .setName(nameController.text);
                  Provider.of<UserData>(context, listen: false)
                      .setGender(genderSelection);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return StateList(
                          // name: nameController.text,
                          );
                    }),
                  );
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
