import 'package:dio/dio.dart';
import 'package:learn_bloc/home/data/models/post_model.dart';

class PostDataProvider {
  Future<List<PostModel>?> getPost() async {
    var dio = Dio();

    var response = await dio.get('https://jsonplaceholder.typicode.com/posts');

    print('Ini dari Dio: ${response.data}');

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
