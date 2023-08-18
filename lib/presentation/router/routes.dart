import 'package:bloc_mvvm_demo/application/exceptions/route_exception.dart';
import 'package:bloc_mvvm_demo/presentation/screens/posts/view/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static const String post = 'post';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case post:
        return PageTransition(
            child: const PostsPage(), type: PageTransitionType.leftToRight);

      default:
        throw const RouteException('Route not found!');
    }
  }
}
