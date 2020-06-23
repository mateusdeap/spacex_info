import 'package:rxdart/rxdart.dart';
import 'package:spacex_info/src/models/launch_model.dart';
import 'package:spacex_info/src/resources/repository.dart';

class UpcomingLaunchesBloc {
  final _repository = Repository();
  final _upcomingLaunches = PublishSubject<List<LaunchModel>>();

  // Getters to streams
  Stream<List<LaunchModel>> get upcomingLaunches => _upcomingLaunches.stream;

  fetchUpcomingLaunches() async {
    final launches = await _repository.fetchUpcomingLaunches();
    _upcomingLaunches.sink.add(launches);
  }

  dispose() {
    _upcomingLaunches.close();
  }
}