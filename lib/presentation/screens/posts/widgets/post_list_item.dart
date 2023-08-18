import 'package:bloc_mvvm_demo/domain/models/post_model/post_model.dart';
import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  const PostListItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${post.id}', style: textTheme.bodySmall),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
        dense: true,
      ),
    );
  }
}
