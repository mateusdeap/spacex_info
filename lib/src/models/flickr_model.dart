class FlickrModel {
  List<String> small;
  List<String> original;

  FlickrModel({this.small, this.original});

  FlickrModel.fromJson(Map<String, dynamic> json) {
    small = List.from(json['small']);
    original = List.from(json['original']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['original'] = this.original;
    return data;
  }
}