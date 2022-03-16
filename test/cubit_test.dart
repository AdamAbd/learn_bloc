import 'package:bloc_test/bloc_test.dart';
import 'package:learn_bloc/home/business_logic/post_cubit.dart';
import 'package:learn_bloc/home/data/entities/post_entity.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Post Cubit', () {
    PostCubit? postCubit;

    setUp(() => postCubit = PostCubit());

    tearDown(() => postCubit!.close());

    test(
      'The initial state for the PostCubit',
      () => expect(postCubit!.state, PostInitial()),
    );

    blocTest(
      'The cubit should emit a CounterState(counterValue:1, wasIncremented:true) when cubit.increment() function is called',
      build: () => postCubit!,
      act: (PostCubit cubit) => cubit.postRepository?.getAllPost(),
      expect: () => [
        PostLoaded(postEntity: [
          PostEntity(
              userId: 1,
              id: 1,
              title:
                  "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
              body:
                  "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"),
        ])
      ],
    );
  });
}
