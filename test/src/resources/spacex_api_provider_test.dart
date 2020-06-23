import 'dart:convert';

import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'package:spacex_info/src/resources/spacex_api_provider.dart';
import 'package:spacex_info/src/models/core_model.dart';
import 'package:spacex_info/src/models/fairings_model.dart';
import 'package:spacex_info/src/models/flickr_model.dart';
import 'package:spacex_info/src/models/launch_model.dart';
import 'package:spacex_info/src/models/links_model.dart';
import 'package:spacex_info/src/models/patch_model.dart';
import 'package:spacex_info/src/models/reddit_model.dart';

void main() {
  test('fetchUpcomingLaunches returns a list of launches', () async {
    final spacexApi = SpacexApiProvider();
    final mockLaunchModels = [
        LaunchModel(
          fairings: FairingsModel(
            ships: []
          ),
          links: LinksModel(
            patch: PatchModel(
              small: "https://images2.imgbox.com/9a/96/nLppz9HW_o.png",
              large: "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png"
            ),
            reddit: RedditModel(
              campaign: "https://www.reddit.com/r/spacex/comments/h8mold/starlink9_launch_campaign_thread/",
            ),
            flickr: FlickrModel(
              small: [],
              original: []
            ),
          ),
          rocket: "5e9d0d95eda69973a809d1ec",
          failures: [],
          details: "This mission will launch the ninth batch of operational Starlink satellites, which are expected to be version 1.0, from LC-39A, Kennedy Space Center. It is the tenth Starlink launch overall. The satellites will be delivered to low Earth orbit and will spend a few weeks maneuvering to their operational altitude of 550 km. This mission is includes a rideshare of two BlackSky satellites on top of the Starlink stack. The booster for this mission is expected to land an ASDS.",
          crew: [],
          ships: [],
          capsules: [],
          payloads: [
            "5ed9858b1f30554030d45c3e",
            "5ee522e32f1f3d474c758123",
          ],
          launchpad: "5e9e4502f509094188566f88",
          autoUpdate: true,
          flightNumber: 97,
          name: "Starlink-9 & BlackSky Global 5-6",
          dateUtc: "2020-06-23T21:22:00.000Z",
          dateUnix: 1592947320,
          dateLocal: "2020-06-23T17:22:00-04:00",
          datePrecision: "hour",
          upcoming: true,
          cores: [
            CoreModel(
              core: "5e9e28a6f35918c0803b265c",
              flight: 5,
              gridfins: true,
              legs: true,
              reused: true,
              landingAttempt: true,
              landingType: "ASDS",
              landpad: "5e9e3033383ecbb9e534e7cc"
            )
          ],
          id: "5ed9819a1f30554030d45c29"
        ),
        LaunchModel(
          fairings: FairingsModel(
            ships: []
          ),
          links: LinksModel(
            patch: PatchModel(),
            reddit: RedditModel(),
            flickr: FlickrModel(
              small: [],
              original: []
            ),
          ),
          rocket: "5e9d0d95eda69973a809d1ec",
          failures: [],
          details: "SpaceX launches GPS Block III Space Vehicle 03 from SLC-40, Cape Canaveral AFS aboard a Falcon 9. GPS III is owned and operated by the US Air Force and produced by Lockheed Martin. This is the third GPS III satellite and the second launched by SpaceX. The satellite will be delivered into a MEO transfer orbit. The booster for this mission is expected to land on an ASDS.",
          crew: [],
          ships: [],
          capsules: [],
          payloads: [
            "5eb0e4d2b6c3bb0006eeb25c",
          ],
          launchpad: "5e9e4501f509094ba4566f84",
          autoUpdate: true,
          flightNumber: 98,
          name: "GPS III SV03 (Columbus)",
          dateUtc: "2020-06-30T19:55:00.000Z",
          dateUnix: 1593546900,
          dateLocal: "2020-06-30T15:55:00-04:00",
          datePrecision: "hour",
          upcoming: true,
          cores: [
            CoreModel(
              gridfins: true,
              legs: true,
              reused: false,
              landingAttempt: true,
              landingType: "ASDS"
            )
          ],
          id: "5eb87d4affd86e000604b38b"
        )
    ];
    spacexApi.client = MockClient((request) async {
      return Response(json.encode(mockLaunchModels), 200);
    });

    final upcomingLaunches = await spacexApi.fetchUpcomingLaunches();
    expect(upcomingLaunches, isA<List<LaunchModel>>());
  });
}
