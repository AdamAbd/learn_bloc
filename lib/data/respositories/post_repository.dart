import 'package:learn_bloc/data/dataproviders/post_dataprovider.dart';
import 'package:learn_bloc/data/entities/post_entity.dart';
import 'package:learn_bloc/data/models/post_model.dart';

class PostRepository {
  final PostDataProvider _postDataProvider;

  PostRepository(this._postDataProvider);

  Future<List<PostEntity>?> getAllPost() async {
    final rawPost = await _postDataProvider.getPost();

    // final List<Post> post = List<Post>.from(
    //   (rawPost as List).map(
    //     (e) => Post.fromJson(e as Map<String, dynamic>),
    //   ),
    // );

    // return List<PostEntity>.from(
    //     (rawPost as List).map(
    //     (e) => e.,
    //   ),
    // );

    return rawPost!.map((e) => e.toPostEntity()).toList();
  }
}
