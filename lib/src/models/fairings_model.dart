class FairingsModel {
  bool reused;
  bool recoveryAttempt;
  bool recovered;
  List<String> ships;

  FairingsModel({this.reused, this.recoveryAttempt, this.recovered, this.ships});

  FairingsModel.fromJson(Map<String, dynamic> json) {
    reused = json['reused'];
    recoveryAttempt = json['recovery_attempt'];
    recovered = json['recovered'];
    ships = List.from(json['ships']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reused'] = this.reused;
    data['recovery_attempt'] = this.recoveryAttempt;
    data['recovered'] = this.recovered;
    data['ships'] = this.ships;
    return data;
  }
}