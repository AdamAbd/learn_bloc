import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/business_logic/post_cubit.dart';
import 'package:learn_bloc/data/dataproviders/post_dataprovider.dart';
import 'package:learn_bloc/data/models/post_model.dart';
import 'package:learn_bloc/data/respositories/post_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCubit>(
      create: (context) =>
          PostCubit(postRepository: PostRepository(PostDataProvider()))..post(),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<Post>? post;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData();
  // }

  // getData() async {
  //   post = await PostDataProvider().getPost();
  //   if (post != null) {
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          print('Ini state $state');
          if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.postEntity!.length,
              itemBuilder: (context, index) {
                final data = state.postEntity![index];

                return Text('${data.title}');
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),

      // body: ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (context, index) {
      //     return const Text('Hallo');
      //   },
      // ),

      // body: post == null
      //     ? const Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //         itemCount: 10,
      //         itemBuilder: (context, index) {
      //           return const Text('Hallo');
      //         },
      //       ),
    );
  }
}

// https://jsonplaceholder.typicode.com/todos/1
