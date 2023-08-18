import 'package:bloc_mvvm_demo/application/api.dart';
import 'package:bloc_mvvm_demo/domain/models/post_model/post_model.dart';
import 'package:bloc_mvvm_demo/domain/service/api_client.dart';

class PostRepository {
  final ApiClient apiClient = ApiClient();

  Future<List<Post>> fetchPostList() async {
    final res = await apiClient.getRequest(Endpoints.postUrl);
    final postList = (res as List).map((e) => Post.fromJson(e)).toList();
    return postList;
  }
}
