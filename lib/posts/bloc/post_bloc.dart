import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../posts.dart';

part 'post_event.dart';
part 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository = PostRepository();

  PostBloc() : super(const PostState()) {
    on<PostEvent>((event, emit) async {
      if (event is PostFetched) {
        try {
          if (state.status == PostStatus.initial) {
            List<Post> posts = await postRepository.fetchPostList();
            emit(state.copyWith(
                status: PostStatus.success,
                posts: posts,));
          }
        } catch (e) {
          print(e);
          emit(state.copyWith(status: PostStatus.failure));
        }
      }
    });
  }
}
