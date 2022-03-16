import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_bloc/home_detail/data/entities/post_detail_entity.dart';
import 'package:learn_bloc/home_detail/data/respositories/post_detail_repository.dart';
import 'package:meta/meta.dart';

part 'post_detail_state.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  final PostDetailRepository? postDetailRepository;

  PostDetailCubit({this.postDetailRepository}) : super(PostDetailInitial());

  Future<void> postSpecific(int idDetail) async {
    emit(PostDetailLoading());

    final response = await postDetailRepository!.getDetailPost(idDetail);

    // response!.fold(
    //   print('initialValue'),
    //   (previousValue, element) async {
    //     emit(PostLoaded(postEntity: PostEntity(id: element.id)));
    //   },
    // );

    emit(PostDetailLoaded(postEntity: response));
  }
}
