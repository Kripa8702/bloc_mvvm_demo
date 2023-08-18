import 'package:bloc_mvvm_demo/infrastructure/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../posts.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider<PostBloc>(
        create: (context) => PostBloc()..add(PostFetched()),
        child: const PostsList(),
      ),
    );
  }
}
