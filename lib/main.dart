import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/feature/home/business_logic/post_cubit.dart';
import 'package:learn_bloc/feature/home/presentation/screens/home_screen.dart';
import 'package:learn_bloc/feature/home_detail/business_logic/post_detail_cubit.dart';
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
