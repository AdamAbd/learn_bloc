// import 'package:learn_bloc/home_detail/data/entities/post_entity.dart';
import 'package:learn_bloc/feature/home_detail/data/dataproviders/post_dataprovider.dart';
import 'package:learn_bloc/feature/home_detail/data/entities/post_detail_entity.dart';

import 'respositories.dart';

class PostDetailRepository {
  final PostDetailProvider _postDetailProvider;

  PostDetailRepository(this._postDetailProvider);

  Future<PostDetailEntity?> getDetailPost(int idDetail) async {
    final rawPost = await _postDetailProvider.getPost(idDetail);

    return rawPost!.toPostDetailEntity();
  }
}
