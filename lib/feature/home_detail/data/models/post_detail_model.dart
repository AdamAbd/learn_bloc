import 'package:learn_bloc/feature/home_detail/data/entities/post_detail_entity.dart';

import 'models.dart';

class PostDetailModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostDetailModel({this.userId, this.id, this.title, this.body});

  factory PostDetailModel.fromJson(Map<String, dynamic> json) {
    return PostDetailModel(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

  PostDetailEntity toPostDetailEntity() => PostDetailEntity(
        id: id,
        userId: userId,
        body: body,
        title: title,
      );
}
