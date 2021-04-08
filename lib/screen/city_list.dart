import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/userData.dart';
import 'package:flutter_application_1/screen/user_info.dart';
import 'package:provider/provider.dart';

import '../api/get_api.dart';

class CityList extends StatefulWidget {
  final String stateId;
  static const routeName = '/city-list';

  const CityList({Key key, this.stateId}) : super(key: key);

  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  GetApi getApi = GetApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cities'),
      ),
      body: FutureBuilder(
        future: getApi.getcityData(widget.stateId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var snap = snapshot.data;
            print('Inside future builder ${snapshot.data}');

            return ListView.builder(
              itemBuilder: (ctx, i) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () => onTap(snap[i]['cityName']),
                      title: Text(
                        snap[i]['cityName'],
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: snap.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  onTap(cityName) {
    Provider.of<UserData>(context, listen: false).setCity(cityName);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => UserInfo(),
      ),
    );
  }
}
