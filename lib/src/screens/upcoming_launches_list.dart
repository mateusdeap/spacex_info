import 'package:flutter/material.dart';
import 'package:spacex_info/src/blocs/upcoming_launches_provider.dart';
import 'package:spacex_info/src/models/launch_model.dart';

class UpcomingLaunchesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = UpcomingLaunchesProvider.of(context);

    bloc.fetchUpcomingLaunches();

    return Scaffold(
      appBar: AppBar(
        title: Text("Upcoming Launches"),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(UpcomingLaunchesBloc bloc) {
    return StreamBuilder(
      stream: bloc.upcomingLaunches,
      builder: (context, AsyncSnapshot<List<LaunchModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Container(
                  margin: EdgeInsets.only(
                    top: 10.0
                  ),
                  child: Text('Loading upcoming launches...'),
                )
              ],
            )
          );
        }

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            return upcomingLaunchElement(snapshot.data[index]);
          },
        );
      },
    );
  }

  Widget upcomingLaunchElement(LaunchModel launchModel) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(4.0),
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      launchModel.name,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IBM Plex Mono'
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      launchModel.details,
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans'
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}