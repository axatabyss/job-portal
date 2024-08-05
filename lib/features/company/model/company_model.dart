import 'package:get/get.dart';

class CompanyModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  RxBool? isApplied;

  CompanyModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl, bool isApplied = false})
      : isApplied = RxBool(isApplied);

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
      isApplied: json['isApplied'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
      'isApplied': isApplied?.value ?? false,
    };
  }
}
