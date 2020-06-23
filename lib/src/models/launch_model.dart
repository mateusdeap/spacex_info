import 'core_model.dart';
import 'fairings_model.dart';
import 'links_model.dart';

class LaunchModel {
  FairingsModel fairings;
  LinksModel links;
  String staticFireDateUtc;
  int staticFireDateUnix;
  bool tdb;
  bool net;
  int window;
  String rocket;
  bool success;
  List<String> failures;
  String _details;
  List<String> crew;
  List<String> ships;
  List<String> capsules;
  List<String> payloads;
  String launchpad;
  bool autoUpdate;
  int flightNumber;
  String name;
  String dateUtc;
  int dateUnix;
  String dateLocal;
  String datePrecision;
  bool upcoming;
  List<CoreModel> cores;
  String id;

  String get details {
    if (_details == null) {
      return "N/A";
    }

    return _details;
  }

  set details(String details) {
    this._details = details;
  }

  LaunchModel(
      {this.fairings,
      this.links,
      this.staticFireDateUtc,
      this.staticFireDateUnix,
      this.tdb,
      this.net,
      this.window,
      this.rocket,
      this.success,
      this.failures,
      details,
      this.crew,
      this.ships,
      this.capsules,
      this.payloads,
      this.launchpad,
      this.autoUpdate,
      this.flightNumber,
      this.name,
      this.dateUtc,
      this.dateUnix,
      this.dateLocal,
      this.datePrecision,
      this.upcoming,
      this.cores,
      this.id});

  LaunchModel.fromJson(Map<String, dynamic> json) {
    fairings = json['fairings'] != null ? new FairingsModel.fromJson(json['fairings']) : null;
    links = json['links'] != null ? new LinksModel.fromJson(json['links']) : null;
    staticFireDateUtc = json['static_fire_date_utc'];
    staticFireDateUnix = json['static_fire_date_unix'];
    tdb = json['tdb'];
    net = json['net'];
    window = json['window'];
    rocket = json['rocket'];
    success = json['success'];
    failures = List.from(json['failures']);
    details = json['details'];
    crew = List.from(json['crew']);
    ships = List.from(json['ships']);
    capsules = List.from(json['capsules']);
    payloads = List.from(json['payloads']);
    launchpad = json['launchpad'];
    autoUpdate = json['auto_update'];
    flightNumber = json['flight_number'];
    name = json['name'];
    dateUtc = json['date_utc'];
    dateUnix = json['date_unix'];
    dateLocal = json['date_local'];
    datePrecision = json['date_precision'];
    upcoming = json['upcoming'];
    if (json['cores'] != null) {
      cores = new List<CoreModel>();
      json['cores'].forEach((v) {
        cores.add(new CoreModel.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fairings != null) {
      data['fairings'] = this.fairings.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    data['static_fire_date_utc'] = this.staticFireDateUtc;
    data['static_fire_date_unix'] = this.staticFireDateUnix;
    data['tdb'] = this.tdb;
    data['net'] = this.net;
    data['window'] = this.window;
    data['rocket'] = this.rocket;
    data['success'] = this.success;
    data['failures'] = this.failures;
    data['details'] = this.details;
    data['crew'] = this.crew;
    data['ships'] = this.ships;
    data['capsules'] = this.capsules;
    data['payloads'] = this.payloads;
    data['launchpad'] = this.launchpad;
    data['auto_update'] = this.autoUpdate;
    data['flight_number'] = this.flightNumber;
    data['name'] = this.name;
    data['date_utc'] = this.dateUtc;
    data['date_unix'] = this.dateUnix;
    data['date_local'] = this.dateLocal;
    data['date_precision'] = this.datePrecision;
    data['upcoming'] = this.upcoming;
    if (this.cores != null) {
      data['cores'] = this.cores.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}
