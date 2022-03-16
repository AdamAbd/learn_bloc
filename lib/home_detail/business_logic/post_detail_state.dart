part of 'post_detail_cubit.dart';

abstract class PostDetailState extends Equatable {
  const PostDetailState();

  @override
  List<Object> get props => [];
}

class PostDetailInitial extends PostDetailState {}

class PostDetailLoading extends PostDetailState {}

class PostDetailLoaded extends PostDetailState {
  final PostDetailEntity? postEntity;

  const PostDetailLoaded({
    this.postEntity,
  });
}
