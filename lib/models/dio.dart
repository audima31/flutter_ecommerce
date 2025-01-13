// To parse this JSON data, do
//
//     final responseGetNewBelajarDio = responseGetNewBelajarDioFromJson(jsonString);

import 'dart:convert';

ResponseGetNewBelajarDio responseGetNewBelajarDioFromJson(String str) =>
    ResponseGetNewBelajarDio.fromJson(json.decode(str));

String responseGetNewBelajarDioToJson(ResponseGetNewBelajarDio data) =>
    json.encode(data.toJson());

class ResponseGetNewBelajarDio {
  bool? success;
  dynamic message;
  Data? data;

  ResponseGetNewBelajarDio({
    this.success,
    this.message,
    this.data,
  });

  factory ResponseGetNewBelajarDio.fromJson(Map<String, dynamic> json) =>
      ResponseGetNewBelajarDio(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? link;
  String? image;
  String? description;
  String? title;
  List<Post>? posts;

  Data({
    this.link,
    this.image,
    this.description,
    this.title,
    this.posts,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        link: json["link"],
        image: json["image"],
        description: json["description"],
        title: json["title"],
        posts: json["posts"] == null
            ? []
            : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "image": image,
        "description": description,
        "title": title,
        "posts": posts == null
            ? []
            : List<dynamic>.from(posts!.map((x) => x.toJson())),
      };
}

class Post {
  String? link;
  String? title;
  DateTime? pubDate;
  String? description;
  String? thumbnail;

  Post({
    this.link,
    this.title,
    this.pubDate,
    this.description,
    this.thumbnail,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        link: json["link"],
        title: json["title"],
        pubDate:
            json["pubDate"] == null ? null : DateTime.parse(json["pubDate"]),
        description: json["description"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "title": title,
        "pubDate": pubDate?.toIso8601String(),
        "description": description,
        "thumbnail": thumbnail,
      };
}
