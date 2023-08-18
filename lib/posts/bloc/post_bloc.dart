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
        if (state.hasReachedMax) return;
        try {
          if (state.status == PostStatus.initial) {
            final posts = await postRepository.fetchPostList();
            return emit(state.copyWith(
                status: PostStatus.success,
                posts: posts,
                hasReachedMax: false));
          }
        } catch (e) {
          emit(state.copyWith(status: PostStatus.failure));
        }
      }
    });
  }
}
