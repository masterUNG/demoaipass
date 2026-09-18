class NewsModel {
  int? id;
  String? title;
  String? subtitle;
  String? detail;
  String? creatorName;
  String? createdAt;
  String? imageBase64;

  NewsModel({this.id, this.title, this.subtitle, this.detail, this.creatorName, this.createdAt, this.imageBase64});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      detail: json['detail'],
      creatorName: json['creator_name'],
      createdAt: json['created_at'],
      imageBase64: json['image_base64'],
    );
  }
}