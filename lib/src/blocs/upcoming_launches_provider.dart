import 'package:flutter/material.dart';
import 'upcoming_launches_bloc.dart';

export 'upcoming_launches_bloc.dart';

class UpcomingLaunchesProvider extends InheritedWidget {
  final UpcomingLaunchesBloc bloc;

  UpcomingLaunchesProvider({Key key, Widget child})
    : bloc = UpcomingLaunchesBloc(),
      super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static UpcomingLaunchesBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UpcomingLaunchesProvider>().bloc;
  }
}