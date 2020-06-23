import 'dart:async';

import 'spacex_api_provider.dart';
import 'package:spacex_info/src/models/launch_model.dart';

class Repository {
  List<Source> sources = <Source>[
    SpacexApiProvider()
  ];

  // TODO: Figure out a better system for registering
  // and calling sources.
  Future<List<LaunchModel>> fetchUpcomingLaunches() {
    return sources[0].fetchUpcomingLaunches();
  }
}

abstract class Source {
  Future<List<LaunchModel>> fetchUpcomingLaunches();
}