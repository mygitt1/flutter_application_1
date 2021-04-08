import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/userData.dart';
import 'package:flutter_application_1/screen/city_list.dart';
import 'package:flutter_application_1/api/get_api.dart';
import 'package:provider/provider.dart';

class StateList extends StatefulWidget {
  static const routeName = '/state-list';
  // final String name;

  // const StateList({Key key, this.name}) : super(key: key);
  @override
  _StateListState createState() => _StateListState();
}

class _StateListState extends State<StateList> {
  GetApi getApi = GetApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('States'),
      ),
      body: FutureBuilder(
        future: getApi.getstateData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var snap = snapshot.data;
            print(snapshot.data);
            return ListView.builder(
              itemBuilder: (ctx, i) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () => onTap(
                        snap[i]['stateId'],
                        snap[i]['stateName'],
                      ),
                      title: Text(
                        snap[i]['stateName'],
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

  onTap(stateId, stateName) {
    Provider.of<UserData>(context, listen: false).setState(stateName);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => CityList(
              stateId: stateId,
            )));
  }
}
