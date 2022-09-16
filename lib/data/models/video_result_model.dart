// To parse this JSON data, do
//
//     final videoResultModel = videoResultModelFromJson(jsonString);

import 'dart:convert';

import 'package:movie_app/domain/entities/watch_video_Entity.dart';

VideoResultModel videoResultModelFromJson(String str) =>
    VideoResultModel.fromJson(json.decode(str));

String videoResultModelToJson(VideoResultModel data) =>
    json.encode(data.toJson());

class VideoResultModel {
  VideoResultModel({
    this.id,
    this.vidoes,
  });

  int? id;
  List<VideoModel>? vidoes;

  factory VideoResultModel.fromJson(Map<String, dynamic> json) =>
      VideoResultModel(
        id: json["id"],
        vidoes: List<VideoModel>.from(
            json["results"].map((x) => VideoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(vidoes!.map((x) => x.toJson())),
      };
}

class VideoModel extends WatchVideoEntity {
  const VideoModel({
    this.iso6391,
    this.iso31661,
    required this.name,
    required this.key,
    this.site,
    this.size,
    required this.type,
    this.official,
    this.publishedAt,
    this.id,
  }) : super(
          name: name,
          key: key,
          type: type,
        );

  final String? iso6391;
  final String? iso31661;
  @override
  final String name;
  @override
  final String key;
  final String? site;
  final int? size;
  @override
  final String type;
  final bool? official;
  final DateTime? publishedAt;
  final String? id;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt,
        "id": id,
      };
}
