import 'dart:convert';

import 'package:http/http.dart' as http;

class GetApi {
  String urlState = 'http://api.minebrat.com/api/v1/states';
  String urlCities =
      'http://api.minebrat.com/api/v1/states/cities/%7BstateId%7D';

  getstateData() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };

    var res = await http.get(urlState, headers: header);
    // .whenComplete(() {
    //   print('api completed');
    // }).catchError((e) {
    //   print(e.toString());
    // });
    // print(res.body.runtimeType);

    return jsonDecode(res.body);
  }

  getcityData(stateId) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var res = await http.get(
        'http://api.minebrat.com/api/v1/states/cities/$stateId',
        headers: header);
    // print(res.body.runtimeType);
    return jsonDecode(res.body);
  }
}
