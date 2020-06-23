import 'package:flutter/material.dart';
import 'blocs/upcoming_launches_provider.dart';
import 'screens/upcoming_launches_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UpcomingLaunchesProvider(
      child: MaterialApp(
        title: 'SpaceX Info',
        home: UpcomingLaunchesList(),
      ),
    );
  }
}
