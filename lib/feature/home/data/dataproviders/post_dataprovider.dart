import 'package:dio/dio.dart';
import 'package:learn_bloc/lib.dart';

import 'dataproviders.dart';

class PostDataProvider {
  final Dio dio;

  PostDataProvider(this.dio);

  Future<List<PostModel>?> getPost() async {
    var response = await dio.get(URLConstant.getDataPost);

    if (response.statusCode == 200) {
      var json = response.data;
      return List<PostModel>.from(
        (json as List).map(
          (e) => PostModel.fromJson(e as Map<String, dynamic>),
        ),
      );
    }
  }
}
