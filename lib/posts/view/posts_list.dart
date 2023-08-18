import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../posts.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        print(state.status);
        switch (state.status) {
          case PostStatus.failure:
            return const Center(child: Text('failed to fetch posts'));

          case PostStatus.initial:
            return const Center(child: CircularProgressIndicator());

          case PostStatus.success:
            if (state.posts.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              itemCount: state.posts.length,
                itemBuilder: (BuildContext context, int index){
                  return PostListItem(post: state.posts[index]);
                });
        }
      },
    );
  }
}
