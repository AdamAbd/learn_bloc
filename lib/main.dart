import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/home/business_logic/post_cubit.dart';
import 'package:learn_bloc/home/data/dataproviders/post_dataprovider.dart';
import 'package:learn_bloc/home/data/respositories/post_repository.dart';
import 'package:learn_bloc/home/presentation/screens/home_screen.dart';
import 'package:learn_bloc/home_detail/business_logic/post_detail_cubit.dart';
import 'package:learn_bloc/home_detail/data/dataproviders/post_dataprovider.dart';
import 'package:learn_bloc/home_detail/data/respositories/post_detail_repository.dart';
import 'locator.dart' as locator;

void main() {
  locator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(
          create: (context) => locator.sl()..post(),
        ),
        BlocProvider<PostDetailCubit>(
          create: (context) => locator.sl(),
          // PostDetailCubit(
          //     postDetailRepository: PostDetailRepository(PostDetailProvider())),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
