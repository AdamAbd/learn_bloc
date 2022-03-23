import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/home/business_logic/post_cubit.dart';
import 'package:learn_bloc/home_detail/presentation/screens/home_detail_screen.dart';

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

                return GestureDetector(
                  onTap: (() => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeDetailPage(id: data.id!),
                        ),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.title!.replaceFirst(
                          data.title![0], data.title![0].toUpperCase()),
                      // .split(' ')
                      // .map((e) => e.replaceFirst(e[0], e[0].toUpperCase()))
                      // .join(' '),
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                );
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
