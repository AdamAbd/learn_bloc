import 'package:dio/dio.dart';
import 'package:learn_bloc/data/models/post.dart';

class PostDataProvider {
  Future<List<Post>?> getPost() async {
    var dio = Dio();

    var response = await dio.get('https://jsonplaceholder.typicode.com/posts');

    print('Ini dari Dio: ${response.data}');

    if (response.statusCode == 200) {
      var json = response.data;
      // return List<Post>.from(
      //   (json as List).map(
      //     (e) => Post.fromJson(e as Map<String, dynamic>),
      //   ),
      // );
      return json;
    }
  }
}
