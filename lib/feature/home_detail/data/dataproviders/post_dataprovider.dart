import 'package:dio/dio.dart';
import 'package:learn_bloc/lib.dart';

import 'dataproviders.dart';

class PostDetailProvider {
  final Dio dio;

  PostDetailProvider(this.dio);
  Future<PostDetailModel?> getPost(int idDetail) async {
    var response = await dio.get(URLConstant.getDataPostDetail + '$idDetail');

    if (response.statusCode == 200) {
      var json = response.data;
      // return List<PostModel>.from(
      //   (json as List).map(
      //     (e) => PostModel.fromJson(e as Map<String, dynamic>),
      //   ),
      // );

      return PostDetailModel.fromJson(json);
    }
  }
}
