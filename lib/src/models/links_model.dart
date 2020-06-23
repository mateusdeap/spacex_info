import 'flickr_model.dart';
import 'patch_model.dart';
import 'reddit_model.dart';

class LinksModel {
  PatchModel patch;
  RedditModel reddit;
  FlickrModel flickr;
  String presskit;
  String webcast;
  String youtubeId;
  String article;
  String wikipedia;

  LinksModel(
      {this.patch,
      this.reddit,
      this.flickr,
      this.presskit,
      this.webcast,
      this.youtubeId,
      this.article,
      this.wikipedia});

  LinksModel.fromJson(Map<String, dynamic> json) {
    patch = json['patch'] != null ? new PatchModel.fromJson(json['patch']) : null;
    reddit =
        json['reddit'] != null ? new RedditModel.fromJson(json['reddit']) : null;
    flickr =
        json['flickr'] != null ? new FlickrModel.fromJson(json['flickr']) : null;
    presskit = json['presskit'];
    webcast = json['webcast'];
    youtubeId = json['youtube_id'];
    article = json['article'];
    wikipedia = json['wikipedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.patch != null) {
      data['patch'] = this.patch.toJson();
    }
    if (this.reddit != null) {
      data['reddit'] = this.reddit.toJson();
    }
    if (this.flickr != null) {
      data['flickr'] = this.flickr.toJson();
    }
    data['presskit'] = this.presskit;
    data['webcast'] = this.webcast;
    data['youtube_id'] = this.youtubeId;
    data['article'] = this.article;
    data['wikipedia'] = this.wikipedia;
    return data;
  }
}