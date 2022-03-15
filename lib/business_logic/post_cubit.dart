import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_bloc/data/entities/post_entity.dart';
import 'package:learn_bloc/data/respositories/post_repository.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository? postRepository;

  PostCubit({this.postRepository}) : super(PostInitial());

  Future<void> post() async {
    emit(PostLoading());

    final response = await postRepository!.getAllPost();

    // response!.fold(
    //   print('initialValue'),
    //   (previousValue, element) async {
    //     emit(PostLoaded(postEntity: PostEntity(id: element.id)));
    //   },
    // );

    emit(PostLoaded(postEntity: response));
  }
}
