import 'package:learn_bloc/data/dataproviders/post_dataprovider.dart';
import 'package:learn_bloc/data/models/post.dart';

class PostRepository {
  final PostDataProvider _postDataProvider;

  PostRepository(this._postDataProvider);

  Future<List<Post>?> getAllPost() async {
    final List<Post>? rawPost = await _postDataProvider.getPost();

    final List<Post> post = List<Post>.from(
      (rawPost as List).map(
        (e) => Post.fromJson(e as Map<String, dynamic>),
      ),
    );

    return post;
  }
}
