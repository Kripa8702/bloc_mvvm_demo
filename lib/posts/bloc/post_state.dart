part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

final class PostState extends Equatable {
  final PostStatus status;
  final List<Post> posts;

  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <Post>[],
  });

  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts];
}
