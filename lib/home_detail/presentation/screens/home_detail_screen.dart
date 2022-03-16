import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/home/business_logic/post_cubit.dart';
import 'package:learn_bloc/home_detail/business_logic/post_detail_cubit.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<PostDetailCubit>().postSpecific(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Magazine ${widget.id}'),
      ),
      body: Center(
        child: BlocBuilder<PostDetailCubit, PostDetailState>(
          builder: (context, state) {
            print('Ini state detail $state');

            if (state is PostDetailLoaded) {
              return Column(
                children: [
                  Text('${state.postEntity!.title}'),
                  Container(),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
