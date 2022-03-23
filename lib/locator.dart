import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_bloc/home/business_logic/post_cubit.dart';
import 'package:learn_bloc/home/data/dataproviders/post_dataprovider.dart';
import 'package:learn_bloc/home/data/respositories/post_repository.dart';
import 'package:learn_bloc/home_detail/business_logic/post_detail_cubit.dart';
import 'package:learn_bloc/home_detail/data/dataproviders/post_dataprovider.dart';
import 'package:learn_bloc/home_detail/data/respositories/post_detail_repository.dart';
import 'package:learn_bloc/remote/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(
    () => DioClient.dioInit(),
  );

  /* Post */
  sl.registerLazySingleton<PostDataProvider>(() => PostDataProvider(sl()));
  sl.registerLazySingleton<PostRepository>(() => PostRepository(sl()));
  sl.registerFactory<PostCubit>(() => PostCubit(postRepository: sl()));

  /* Post Detail */
  sl.registerLazySingleton<PostDetailProvider>(() => PostDetailProvider(sl()));
  sl.registerLazySingleton<PostDetailRepository>(
      () => PostDetailRepository(sl()));
  sl.registerFactory<PostDetailCubit>(
      () => PostDetailCubit(postDetailRepository: sl()));
}
