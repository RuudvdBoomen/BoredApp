import 'dart:convert';

import 'package:boring_app/objects/activity.dart';
import 'package:http/http.dart';

class ApiService {
  Future<Activity> getActivity() async {
    final response = await get('http://www.boredapi.com/api/activity/');

    if (response.statusCode == 200) {
      return Activity.fromJson(json.decode(response.body));
    } else {
      return Activity.withError('No activity found');
    }
  }

  Future<Activity> getPersonalActivity(
      double accessibility, String type, int participants, double price) async {
    String request = 'http://www.boredapi.com/api/activity' +
        '?accessibility=$accessibility&type=$type&participants=$participants&price=$price';
    final response = await get(request);
    if (response.statusCode == 200 && !response.body.contains('error')) {
      return Activity.fromJson(json.decode(response.body));
    } else {
      return Activity.withError('No activity found');
    }
  }
}
