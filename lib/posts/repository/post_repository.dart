import 'package:bloc_mvvm_demo/constants/endpoints.dart';
import 'package:bloc_mvvm_demo/utils/api_client.dart';

import '../posts.dart';

class PostRepository{
  final ApiClient apiClient = ApiClient();

  Future<List<Post>> fetchPostList() async {
    final res = await apiClient.getRequest(Endpoints.postUrl);
    final postList = (res as List).map((e) => Post.fromJson(e)).toList();
    return postList;
  }
}