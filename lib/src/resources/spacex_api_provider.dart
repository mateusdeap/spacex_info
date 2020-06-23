import 'dart:convert';

import 'package:http/http.dart' show Client;

import 'package:spacex_info/src/models/launch_model.dart';
import 'package:spacex_info/src/resources/repository.dart';

final _baseUrl = "https://api.spacexdata.com/v4";

class SpacexApiProvider implements Source {
  Client client = Client();

  Future<List<LaunchModel>> fetchUpcomingLaunches() async {
    final response = await client.get("$_baseUrl/launches/upcoming");
    final List<dynamic> upcomingLaunchesJson = json.decode(response.body);

    List<LaunchModel> upcomingLaunches = [];
    upcomingLaunchesJson.forEach((element) {
      upcomingLaunches.add(LaunchModel.fromJson(element));
    });

    return upcomingLaunches;
  }
}